import sys

from src import avbtool


class AVBInfo:

    def __init__(self):
        ...

    @staticmethod
    def print_calc_digest(file_path, hash_algorithm='sha256'):
        avb = avbtool.Avb()
        avb.calculate_vbmeta_digest(file_path, hash_algorithm, sys.stdout)

    @staticmethod
    def print_info_image(file_path):
        avb = avbtool.Avb()
        avb.info_image(file_path, sys.stdout, True)

    @staticmethod
    def print_partition(file_path):
        avb = avbtool.Avb()
        avb.print_partition_digests(file_path, sys.stdout, True)

    @staticmethod
    def print_image_handler_info(file_path):
        img_handler = avbtool.ImageHandler(file_path)
        print("File Name:", img_handler.filename)
        print("Reading Position:", img_handler.tell())
        print("Sparse:", img_handler.is_sparse)
        print("Block Size:", img_handler.block_size)
        print("Image Size:", img_handler.image_size)

    @staticmethod
    def print_vbmeta_sizes(file_path):
        header = avbtool.AvbVBMetaHeader(avbtool.ImageHandler(file_path, True).read(avbtool.AvbVBMetaHeader.SIZE))
        print(header.signature_size, header.hash_size, header.descriptors_size, header.public_key_metadata_size,
              header.public_key_size, header.auxiliary_data_block_size, header.authentication_data_block_size)
