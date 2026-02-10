import struct
import os

from src.Global import Global

SECTOR_SIZE = 512
GPT_HEADER_OFFSET = SECTOR_SIZE
PARTITION_ENTRY_SIZE = 128
NUM_PARTITION_ENTRIES = 128
ALIGNMENT_SECTORS = 2048

class MainSystemTool:

    def __init__(self):
        ...

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
    def find_offset(img_path, img_name):
        with (open(img_path, 'rb') as f):

            f.seek(GPT_HEADER_OFFSET)
            header = f.read(92)
            if len(header) < 92:
                print("Not GPT header")
                return

            signature, revision, header_size, crc32_header, reserved, current_lba, backup_lba, first_usable_lba, last_usable_lba, disk_guid, partition_entry_lba, num_partition_entries, partition_entry_size, crc32_entries = struct.unpack(
                '<8sI I I I Q Q Q Q 16s Q I I I', header[:92])

            if signature != b'EFI PART':
                print("Not GPT signature")
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

                name = str(i) + "." + partition_name.decode('utf-16le').rstrip('\x00') + ".img"
                if name == img_name:
                    return starting_lba * SECTOR_SIZE
            return -1

    # You can just use 7zip
    @staticmethod
    def unpack_partitions(img_path, result_folder_path):
        print(f"Extracting {img_path} into {result_folder_path}")
        with (open(img_path, 'rb') as f):

            f.seek(GPT_HEADER_OFFSET)
            header = f.read(92)
            if len(header) < 92:
                print("Not GPT header")
                return

            signature, revision, header_size, crc32_header, reserved, current_lba, backup_lba, first_usable_lba, last_usable_lba, disk_guid, partition_entry_lba, num_partition_entries, partition_entry_size, crc32_entries = struct.unpack(
                '<8sI I I I Q Q Q Q 16s Q I I I', header[:92])

            if signature != b'EFI PART':
                print("Not GPT signature")
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

                print(f"Partition {i}: {name}, start LBA {starting_lba}, size {size} bytes")

                output_file = os.path.join(result_folder_path, f"{i}.{name}.img")
                with open(output_file, 'wb') as out:
                    f.seek(start_offset)
                    out.write(f.read(size))
        print("Done\n")


if __name__ == '__main__':
    ...
