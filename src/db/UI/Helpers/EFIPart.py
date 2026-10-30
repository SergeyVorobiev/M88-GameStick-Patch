import copy
import struct
import zlib


class EFIPart:

    def __init__(self, str_bytes: bytes):
        self.__start = str_bytes.find(b'EFI PART')
        if self.__start == -1:
            raise Exception('EFI Part not found')
        self.__efi_bytes = str_bytes[self.__start:self.__start+92]
        self.__signature, self.__revision, self.__efi_size, self.__crc32_efi, self.__reserved, self.__current_lba, self.__backup_lba, self.__first_usable_lba, self.__last_usable_lba, self.__disk_guid, self.__partition_entry_lba, self.__num_partition_entries, self.__partition_entry_size, self.__crc32_entries = struct.unpack(
            '<8sI I I I Q Q Q Q 16s Q I I I', self.__efi_bytes)

    def clone(self):
        return copy.deepcopy(self)

    def get_start(self):
        return self.__start

    def get_signature(self):
        return self.__signature

    def get_num_partition_entries(self):
        return self.__num_partition_entries

    def get_partition_entry_size(self):
        return self.__partition_entry_size

    def get_partition_entry_lba(self):
        return self.__partition_entry_lba

    def __pack_efi(self):
        temp = struct.pack(
            '<8sI I I I Q Q Q Q 16s Q I I I', self.__signature, self.__revision, self.__efi_size, 0, self.__reserved, self.__current_lba, self.__backup_lba, self.__first_usable_lba, self.__last_usable_lba, self.__disk_guid, self.__partition_entry_lba, self.__num_partition_entries, self.__partition_entry_size, self.__crc32_entries)
        crc = zlib.crc32(bytes(temp)) & 0xFFFFFFFF
        self.__crc32_efi = crc
        crc_bytes = struct.pack('<I', crc)
        temp = bytearray(temp)
        temp[16:20] = crc_bytes
        self.__efi_bytes = bytes(temp)

    def get_efi_bytes(self):
        return self.__efi_bytes

    def set_signature(self, signature):
        self.__signature = signature
        self.__pack_efi()

    def set_revision(self, revision):
        self.__revision = revision
        self.__pack_efi()

    def set_entries_crc32(self, entries_crc32):
        self.__crc32_entries = entries_crc32
        self.__pack_efi()

    def get_efi_crc32(self):
        return self.__crc32_efi

    def get_entries_crc32(self):
        return self.__crc32_entries

    def __str__(self):
        return "Signature: " + str(self.__signature) + \
         "\nRevision: " + str(self.__revision) + \
         "\nEFI Size: " + str(self.__efi_size) + \
         "\nEFI CRC32: " + str(self.__crc32_efi) + \
         "\nReserved: " + str(self.__reserved) + \
         "\nCurrent LBA: " + str(self.__current_lba) + \
         "\nBackup LBA: " + str(self.__backup_lba) + \
         "\nFirst usable LBA: " + str(self.__first_usable_lba) + \
         "\nLast usable LBA: " + str(self.__last_usable_lba) + \
         "\nDisk GUID: " + str(self.__disk_guid) + \
         "\nPartition entry LBA: " + str(self.__partition_entry_lba) + \
         "\nNum partition entries: " + str(self.__num_partition_entries) + \
         "\nPartition entry size: " + str(self.__partition_entry_size) + \
         "\nEntries CRC32: " + str(self.__crc32_entries)
