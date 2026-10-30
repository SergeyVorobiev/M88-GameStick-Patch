import struct
import os

from src.Global import Global

from src.db.UI.Helpers.EFIPart import EFIPart
from src.db.UI.Helpers.GPT import GPT
from src.db.UI.Helpers.PartitionMetaData import PartitionMetaData


SECTOR_SIZE = 512
GPT_HEADER_OFFSET = SECTOR_SIZE
PARTITION_ENTRY_SIZE = 128
NUM_PARTITION_ENTRIES = 128
ALIGNMENT_SECTORS = 2048

class MainSystemTool:

    HEADER_SIZE = 32768
    TAIL_SIZE = 32768

    def __init__(self):
        ...

    @staticmethod
    def get_header(img_path):
        with open(img_path, 'rb') as file:
            return file.read(MainSystemTool.HEADER_SIZE)

    @staticmethod
    def get_tail(img_path):
        size = os.path.getsize(img_path)
        with open(img_path, 'rb') as file:
            file.seek(size - MainSystemTool.TAIL_SIZE)
            return file.read(MainSystemTool.TAIL_SIZE)

    # Assembling a system image by replacing original leaving header and tail untouched (header and tail will be taken from original image)
    @staticmethod
    def pack_system0_partition(original_img_path=None, updated_system_path=None, updated_img_path=None):
        if not updated_img_path:
            updated_img_path = Global.updated_image_path
        if not original_img_path:
            original_img_path = Global.image_path
        if not updated_system_path:
            updated_system_path = Global.updated_0_system_path
        print(f"Packing into {updated_img_path}")
        with open(original_img_path, "rb") as orig, open(updated_img_path, "wb") as new:
            sectors_size = SECTOR_SIZE * ALIGNMENT_SECTORS
            total = sectors_size

            print(f"Writing header {sectors_size} bytes")
            head = orig.read(sectors_size)
            new.write(head)

            system_size = os.path.getsize(updated_system_path)
            total += system_size
            print(f"Writing system {system_size} bytes")
            with open(updated_system_path, "rb") as system_file:
                new.write(system_file.read())

            orig_size = os.path.getsize(original_img_path)
            total += sectors_size
            print(f"Writing tail {sectors_size} bytes")
            orig.seek(orig_size - sectors_size)
            new.write(orig.read(sectors_size))
            print(f"Done, total: {total} bytes")

    # Pack vbmeta and super images into system image leaving header and tail untouched (header and tail will be taken from original image)
    @staticmethod
    def pack_partitions(original_img_path=None, updated_img_path=None, updated_vbmeta_path=None, updated_super_path=None):
        if not updated_img_path:
            updated_img_path = Global.updated_image_path
        if not original_img_path:
            original_img_path = Global.image_path
        if not updated_vbmeta_path:
            updated_vbmeta_path = Global.updated_vbmeta_path
        if not updated_super_path:
            updated_super_path = Global.updated_super_path
        print("Packing into:", updated_img_path)
        with open(original_img_path, "rb") as orig, open(updated_img_path, "wb") as new:
            sectors_size = SECTOR_SIZE * ALIGNMENT_SECTORS
            total = sectors_size

            print(f"Writing header {sectors_size} bytes", "from:", original_img_path)
            head = orig.read(sectors_size)
            new.write(head)

            vbmeta_size = os.path.getsize(updated_vbmeta_path)
            total += vbmeta_size
            print(f"Writing vbmeta {vbmeta_size} bytes", updated_vbmeta_path)
            with open(updated_vbmeta_path, "rb") as vbmeta:
                new.write(vbmeta.read())

            super_size = os.path.getsize(updated_super_path)
            total += super_size
            print(f"Writing super {super_size} bytes", updated_super_path)
            with open(updated_super_path, "rb") as super_file:
                new.write(super_file.read())

            orig_size = os.path.getsize(Global.image_path)
            total += sectors_size
            print(f"Writing tail {sectors_size} bytes", "from:", original_img_path)
            orig.seek(orig_size - sectors_size)
            new.write(orig.read(sectors_size))
            print(f"Done, total: {total} bytes")

    @staticmethod
    def get_image_list(img_path, printc=None):
        if printc is None:
            printc = print
        result = []
        with (open(img_path, 'rb') as f):

            f.seek(GPT_HEADER_OFFSET)
            header = f.read(92)
            if len(header) < 92:
                printc("Not GPT header")
                return result

            signature, revision, header_size, crc32_header, reserved, current_lba, backup_lba, first_usable_lba, last_usable_lba, disk_guid, partition_entry_lba, num_partition_entries, partition_entry_size, crc32_entries = struct.unpack(
                '<8sI I I I Q Q Q Q 16s Q I I I', header[:92])

            if signature != b'EFI PART':
                printc("Not GPT signature")
                return result

            f.seek(partition_entry_lba * SECTOR_SIZE)
            entries_data = f.read(NUM_PARTITION_ENTRIES * PARTITION_ENTRY_SIZE)

            for i in range(NUM_PARTITION_ENTRIES):
                entry_offset = i * PARTITION_ENTRY_SIZE
                entry = entries_data[entry_offset:entry_offset + PARTITION_ENTRY_SIZE]

                if all(b == 0 for b in entry):
                    continue

                partition_type_guid, unique_guid, starting_lba, ending_lba, attributes, partition_name = struct.unpack(
                    '<16s 16s Q Q Q 72s', entry)

                name = partition_name.decode('utf-16le').rstrip('\x00') + ".img"
                start_offset = starting_lba * SECTOR_SIZE
                end_offset = (ending_lba + 1) * SECTOR_SIZE
                size = end_offset - start_offset
                result.append((name, start_offset, size))
        return result

    @staticmethod
    def find_offset(img_path, img_name):
        with (open(img_path, 'rb') as f):

            f.seek(GPT_HEADER_OFFSET)
            header = f.read(92)
            if len(header) < 92:
                print("Not GPT header")
                return -1, -1

            signature, revision, header_size, crc32_header, reserved, current_lba, backup_lba, first_usable_lba, last_usable_lba, disk_guid, partition_entry_lba, num_partition_entries, partition_entry_size, crc32_entries = struct.unpack(
                '<8sI I I I Q Q Q Q 16s Q I I I', header[:92])

            if signature != b'EFI PART':
                print("Not GPT signature")
                return -1, -1

            f.seek(partition_entry_lba * SECTOR_SIZE)
            entries_data = f.read(NUM_PARTITION_ENTRIES * PARTITION_ENTRY_SIZE)

            for i in range(NUM_PARTITION_ENTRIES):
                entry_offset = i * PARTITION_ENTRY_SIZE
                entry = entries_data[entry_offset:entry_offset + PARTITION_ENTRY_SIZE]

                if all(b == 0 for b in entry):
                    continue

                partition_type_guid, unique_guid, starting_lba, ending_lba, attributes, partition_name = struct.unpack(
                    '<16s 16s Q Q Q 72s', entry)

                name = partition_name.decode('utf-16le').rstrip('\x00') + ".img"
                if name == img_name:
                    start_offset = starting_lba * SECTOR_SIZE
                    end_offset = (ending_lba + 1) * SECTOR_SIZE
                    size = end_offset - start_offset
                    return starting_lba * SECTOR_SIZE, size
            return -1, -1

    # partitions_data
    @staticmethod
    def get_partitions_meta_data(img_path):
        result = []
        efi = EFIPart(MainSystemTool.get_header(img_path))
        with (open(img_path, 'rb') as f):
            f.seek(efi.get_partition_entry_lba() * SECTOR_SIZE)
            entries_data = f.read(NUM_PARTITION_ENTRIES * PARTITION_ENTRY_SIZE)
            k = 0
            for i in range(NUM_PARTITION_ENTRIES):
                entry_offset = i * PARTITION_ENTRY_SIZE
                entry = entries_data[entry_offset:entry_offset + PARTITION_ENTRY_SIZE]
                if all(b == 0 for b in entry):
                    continue

                partition_type_guid, unique_guid, starting_lba, ending_lba, attributes, partition_name = struct.unpack(
                    '<16s 16s Q Q Q 72s', entry)

                name = partition_name.decode('utf-16le').rstrip('\x00')

                start_offset = starting_lba * SECTOR_SIZE
                end_offset = (ending_lba + 1) * SECTOR_SIZE
                size = end_offset - start_offset
                data = PartitionMetaData(k, name, start_offset, size, starting_lba, ending_lba, partition_type_guid, unique_guid, attributes)
                result.append(data)
                k += 1
        return result

    # You can just use 7zip
    # callback(number, name, start, size)
    @staticmethod
    def unpack_partitions(img_path, result_folder_path, partition_to_extract="All", printc=None, callback=None):
        if not printc:
            printc = print
        printc(f"Extracting {img_path} into {result_folder_path}")
        with (open(img_path, 'rb') as f):

            f.seek(GPT_HEADER_OFFSET)
            header = f.read(92)
            if len(header) < 92:
                printc("Not GPT header")
                return

            signature, revision, header_size, crc32_header, reserved, current_lba, backup_lba, first_usable_lba, last_usable_lba, disk_guid, partition_entry_lba, num_partition_entries, partition_entry_size, crc32_entries = struct.unpack(
                '<8sI I I I Q Q Q Q 16s Q I I I', header[:92])

            if signature != b'EFI PART':
                printc("Not GPT signature")
                return

            f.seek(partition_entry_lba * SECTOR_SIZE)
            entries_data = f.read(NUM_PARTITION_ENTRIES * PARTITION_ENTRY_SIZE)

            for i in range(NUM_PARTITION_ENTRIES):
                entry_offset = i * PARTITION_ENTRY_SIZE
                entry = entries_data[entry_offset:entry_offset + PARTITION_ENTRY_SIZE]

                if all(b == 0 for b in entry):
                    continue

                partition_type_guid, unique_guid, starting_lba, ending_lba, attributes, partition_name = struct.unpack(
                    '<16s 16s Q Q Q 72s', entry)

                name = partition_name.decode('utf-16le').rstrip('\x00')

                start_offset = starting_lba * SECTOR_SIZE
                end_offset = (ending_lba + 1) * SECTOR_SIZE
                size = end_offset - start_offset

                printc(f"Partition {i}: {name}, start LBA {starting_lba}, size {size} bytes")
                name_img = f"{name}.img"
                output_file = os.path.join(result_folder_path, name_img)
                if partition_to_extract != "All" and partition_to_extract != name:
                    continue
                with open(output_file, 'wb') as out:
                    f.seek(start_offset)
                    out.write(f.read(size))
                if callback is not None:
                    callback(i, name, start_offset, size)
        printc("Done\n")

    @staticmethod
    def get_images_total_size(partitions_data: list[PartitionMetaData]):
        size = 0
        for partition_data in partitions_data:
            size += partition_data.size
        return size

    # new_img_sizes = {"super" : new_size, "other_img" : new_size}
    # img_name_to_know_size = like: "userdata"
    @staticmethod
    def calculate_partition_size(img_path, new_img_sizes: dict, img_name_to_know_size):
        partitions_data: list[PartitionMetaData] = MainSystemTool.get_partitions_meta_data(img_path)
        default_size = MainSystemTool.get_images_total_size(partitions_data)
        new_size = 0
        for partition_data in partitions_data:
            if img_name_to_know_size == partition_data.name:
                continue
            size = partition_data.size
            possible_size = new_img_sizes.get(partition_data.name)
            if possible_size is not None:
                size = possible_size
            new_size += size
        return default_size - new_size

    @staticmethod
    def __reassemble_user_image(img_path, partitions_data, printc):
        if True: #? Check the size of new image is equal to the old one
            total_new_size = MainSystemTool.get_images_total_size(partitions_data) + MainSystemTool.HEADER_SIZE + MainSystemTool.TAIL_SIZE
            size = os.path.getsize(img_path)
            if total_new_size != size:
                raise Exception(f"New total size of images must be equal to the size of the original User.img\nNew: {total_new_size} Original: {size}")

        gpt = GPT()
        header1 = MainSystemTool.get_header(img_path)
        header_efi = EFIPart(header1)

        entries_data, entries_crc32 = GPT.create_partition_entries(partitions_data,
                                                                   header_efi.get_num_partition_entries(),
                                                                   header_efi.get_partition_entry_size())
        printc("Partition entries are created, CRC32:", entries_crc32)
        mbr = gpt.clone_protective_mbr(img_path)
        printc("\nStarting to assemble header")
        new_header_efi = header_efi.clone()
        new_header_efi.set_entries_crc32(entries_crc32)
        new_header = gpt.modify_header(header1, mbr, entries_data, new_header_efi.get_efi_bytes())
        printc(new_header_efi)

        printc("\nStarting to assemble tail")
        tail1 = MainSystemTool.get_tail(img_path)
        tail_efi = EFIPart(tail1)
        new_tail_efi = tail_efi.clone()
        new_tail_efi.set_entries_crc32(entries_crc32)
        new_tail = gpt.modify_tail(tail1, entries_data, new_tail_efi.get_efi_bytes())
        printc(new_tail_efi)

        printc("\nStarting to write partitions into USER.img:")
        with open(img_path, 'wb') as f:
            printc("\n=============================================")
            printc("Header")
            f.write(new_header)
            chunk_size = 64 * 1024 * 1024
            for part in partitions_data:
                printc(str(part.index) + "." + part.name + ".img", "Offset:", part.offset, "Start LBA:", part.start_lba,
                       "Size:", part.size)

                with open(part.path, 'rb') as img_file:
                    while True:
                        chunk = img_file.read(chunk_size)
                        if not chunk:
                            break
                        f.write(chunk)
            printc("Tail")
            printc("=============================================\n")
            f.write(new_tail)

    # Relies on the fact that the total size of original and updated images are the same
    # img_path - will be updated in place
    @staticmethod
    def reassemble_user_image(img_path, updated_images_folder_path, printc=None):
        if printc is None:
            printc = print

        offset = MainSystemTool.HEADER_SIZE # 32KB
        printc("Starting to build partitions data")
        partitions_data: list[PartitionMetaData] = MainSystemTool.get_partitions_meta_data(img_path)
        for part in partitions_data:
            file_path = updated_images_folder_path + os.sep + part.name + ".img"
            offset += part.update_partition_layout_from_path(file_path, offset)
            printc(part.name, "Offset:", offset, "Size:", part.size, "Start LBA:", part.start_lba)
        MainSystemTool.__reassemble_user_image(img_path, partitions_data, printc)

    # updated_images_paths = {"super" : "path_to_image"}
    @staticmethod
    def reassemble_user_image_with_paths(img_path, updated_images_paths, printc=None):
        if printc is None:
            printc = print

        offset = MainSystemTool.HEADER_SIZE  # 32KB
        printc("Starting to build partitions data")
        partitions_data: list[PartitionMetaData] = MainSystemTool.get_partitions_meta_data(img_path)
        for part in partitions_data:
            file_path = updated_images_paths[part.name]
            offset += part.update_partition_layout_from_path(file_path, offset)
            printc(part.name, "Offset:", offset, "Size:", part.size, "Start LBA:", part.start_lba)
        MainSystemTool.__reassemble_user_image(img_path, partitions_data, printc)

    @staticmethod
    def check_image_has_size(main_path, image_name, size):
        partitions = MainSystemTool.get_partitions_meta_data(main_path)
        for partition in partitions:
            if partition.name == image_name:
                if partition.size == size:
                    return True
        return False
