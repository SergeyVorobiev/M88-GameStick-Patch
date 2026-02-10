from src.CMD import CMD

def get_add_footer_command(img_path, partition_name, partition_size):
    return [
        'python', 'avbtool.py', 'add_hashtree_footer',
        '--image', img_path,
        '--partition_name', partition_name,
        '--partition_size', partition_size,
        '--do_not_generate_fec',
        '--hash_algorithm', 'sha1',
        '--algorithm','SHA256_RSA2048',
        '--key', 'verif/rsa2048.pem',
        '--salt', '7e1037d90feb2438fcc16ac51c9aca000bcf6746'
    ]

def get_add_footer_command2(img_path, partition_name, partition_size):
    return [
        'python', 'avbtool.py', 'add_hashtree_footer',
        '--image', img_path,
        '--partition_name', partition_name,
        '--partition_size', partition_size,
        '--hash_algorithm', 'sha1',
        '--algorithm','NONE',
        '--flags', '0',
        '--do_not_generate_fec',
        '--salt', '7e1037d90feb2438fcc16ac51c9aca000bcf6746',
        '--kernel_cmdline', "dm=\"1 vroot none ro 1,0 5159992 verity 1 PARTUUID=CCBCABD5-6445-412D-A10F-2F74DBBACCD1 PARTUUID=CCBCABD5-6445-412D-A10F-2F74DBBACCD1 4096 4096 644999 644999 sha1 0011390ef3aa44087ea27d0e16a4107410518496 7e1037d90feb2438fcc16ac51c9aca000bcf6746 1 ignore_zero_blocks\""
    ]

def get_make_vb_meta_command(output_vbmeta_path, padding_size=1048576):
    return [
        'python', 'avbtool.py', 'make_vbmeta_image',
        '--output', output_vbmeta_path,
        '--algorithm', 'SHA256_RSA2048',
        '--key', 'rsa2048.pem',
        '--chain_partition', 'system:1:verif/system_key.bin',
        '--padding_size', padding_size
    ]

if __name__ == '__main__':
    ...