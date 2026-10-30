import struct
import zlib


class GPT:
    def __init__(self):
        ...

    # LBA 0 (Preferable if the total sectors is not about to be changed)
    # 0 - 512
    @staticmethod
    def clone_protective_mbr(original_img_path):
        with open(original_img_path, 'rb') as file:
            return file.read(512)

    # LBA 0 (0 - 512)
    @staticmethod
    def create_protective_mbr(total_sectors):
        mbr = bytearray(512)

        # Starting from 446
        offset = 446
        mbr[offset] = 0x00  # Status
        mbr[offset + 4] = 0xEE  # Type: GPT Protective
        mbr[offset + 8:offset + 12] = struct.pack('<I', 1)  # Start LBA = 1

        size = min(total_sectors - 1, 0xFFFFFFFF)
        mbr[offset + 12:offset + 16] = struct.pack('<I', size)

        mbr[510] = 0x55
        mbr[511] = 0xAA

        return bytes(mbr)

    @staticmethod
    def calculate_partition_entries_crc_32(partition_entries):
        return zlib.crc32(partition_entries) & 0xFFFFFFFF

    # entries data + crc32
    @staticmethod
    def create_partition_entries(partitions, num_partition_entries, partition_entry_size):
        entries_data = b''

        for partition in partitions:
            name_utf16 = partition.name.encode('utf-16le')
            name_padded = name_utf16.ljust(72, b'\x00')

            entry = struct.pack(
                '<16s 16s Q Q Q 72s',
                partition.t_guid.bytes_le,
                partition.p_guid.bytes_le,
                partition.start_lba,
                partition.end_lba,
                partition.attributes,
                name_padded
            )
            entries_data += entry

        remaining = num_partition_entries - len(partitions)
        entries_data += b'\x00' * (remaining * partition_entry_size)
        crc_32 = GPT.calculate_partition_entries_crc_32(entries_data)
        return entries_data, crc_32

    # Relies on the fact that the number of partitions is unchanged
    # header is the first 32KB part of a GPT image
    @staticmethod
    def modify_header(header, protective_mbr, entries_data, efi_bytes):
        new_header = bytearray(header)
        new_header[0:512] = protective_mbr
        new_header[512:512+92] = efi_bytes
        new_header[1024:1024+len(entries_data)] = entries_data
        return bytes(new_header)

    # Relies on the fact that the number of partitions is unchanged
    # tail is the last 32KB part of a GPT image
    @staticmethod
    def modify_tail(tail, entries_data, efi_bytes):
        new_tail = bytearray(tail)
        tail_size = len(new_tail) #32KB
        efi_start = tail_size - 512
        new_tail[efi_start:efi_start+92] = efi_bytes
        entries_size = len(entries_data)
        entries_start = tail_size - entries_size - 512
        new_tail[entries_start:entries_start+entries_size] = entries_data
        return bytes(new_tail)
