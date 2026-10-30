import os
import uuid


class PartitionMetaData:

    SECTOR_SIZE = 512
    def __init__(self, index, name, offset, size, start_lba, end_lba, t_guid, p_guid, attributes, path=None):
        self.index = index
        self.name = name
        self.offset = offset # bytes
        self.size = size # bytes
        self.start_lba = start_lba
        self.end_lba = end_lba
        self.t_guid = uuid.UUID(bytes_le=t_guid) # Type GUID
        self.p_guid = uuid.UUID(bytes_le=p_guid) # Partition GUID
        self.attributes = attributes
        self.path = str(path)

    def __str__(self):
        return str(self.index) + "." + self.name + ".img" + " " + str(self.offset) + " Size: " + str(self.size) + " TGUID: " + str(self.t_guid) + " PGUID: " + str(self.p_guid) + " Attrs: " + str(self.attributes) + " Path: " + self.path

    def update_partition_layout_from_path(self, path, offset):
        if not os.path.exists(path):
            raise Exception("Path does not exist")
        self.path = path
        self.offset = offset
        self.size = os.path.getsize(path)
        lba = self.size // self.SECTOR_SIZE
        self.start_lba = self.offset // self.SECTOR_SIZE
        self.end_lba = self.start_lba + lba - 1
        return self.size
