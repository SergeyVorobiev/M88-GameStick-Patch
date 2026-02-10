import hashlib
import os

partitions = [
    ("misc.img", 0x0000000000008000, 0x0000000000080000),
    ("para.img", 0x0000000000088000, 0x0000000000080000),
    ("expdb.img", 0x0000000000108000, 0x0000000001400000),
    ("frp.img", 0x0000000001508000, 0x0000000000100000),
    ("vbmeta_a.img", 0x0000000001608000, 0x0000000000800000),
    ("vbmeta_system_a.img", 0x0000000001e08000, 0x0000000000800000),
    ("vbmeta_vendor_a.img", 0x0000000002608000, 0x0000000000800000),
    ("vbmeta_b.img", 0x0000000002e08000, 0x0000000000800000),
    ("vbmeta_system_b.img", 0x0000000003608000, 0x0000000000800000),
    ("vbmeta_vendor_b.img", 0x0000000003e08000, 0x0000000000800000),
    ("md_udc.img", 0x0000000004608000, 0x000000000169a000),
    ("metadata.img", 0x0000000005ca2000, 0x0000000002000000),
    ("nvcfg.img", 0x0000000007ca2000, 0x0000000002000000),
    ("nvdata.img", 0x0000000009ca2000, 0x0000000004000000),
    ("protect1.img", 0x000000000dca2000, 0x0000000000800000),
    ("protect2.img", 0x000000000e4a2000, 0x0000000000b5e000),
    ("seccfg.img", 0x000000000f000000, 0x0000000000800000),
    ("md1img_a.img", 0x000000000f800000, 0x0000000008000000),
    ("spmfw_a.img", 0x0000000017800000, 0x0000000000100000),
    ("scp_a.img", 0x0000000017900000, 0x0000000000600000),
    ("sspm_a.img", 0x0000000017f00000, 0x0000000000100000),
    ("gz_a.img", 0x0000000018000000, 0x0000000001000000),
    ("lk_a.img", 0x0000000019000000, 0x0000000000200000),
    ("boot_a.img", 0x0000000019200000, 0x0000000002000000),
    ("vendor_boot_a.img", 0x000000001b200000, 0x0000000004000000),
    ("init_boot_a.img", 0x000000001f200000, 0x0000000000800000),
    ("dtbo_a.img", 0x000000001fa00000, 0x0000000000800000),
    ("tee_a.img", 0x0000000020200000, 0x0000000000600000),
    ("sec1.img", 0x0000000020800000, 0x0000000000200000),
    ("proinfo.img", 0x0000000020a00000, 0x0000000000300000),
    ("boot_para.img", 0x0000000020d00000, 0x0000000001a00000),
    ("nvram.img", 0x0000000022700000, 0x0000000004000000),
    ("csci.img", 0x0000000026700000, 0x0000000000100000),
    ("logo.img", 0x0000000026800000, 0x0000000000800000),
    ("md1img_b.img", 0x0000000027000000, 0x0000000008000000),
    ("spmfw_b.img", 0x000000002f000000, 0x0000000000100000),
    ("scp_b.img", 0x000000002f100000, 0x0000000000600000),
    ("sspm_b.img", 0x000000002f700000, 0x0000000000100000),
    ("gz_b.img", 0x000000002f800000, 0x0000000001000000),
    ("lk_b.img", 0x0000000030800000, 0x0000000000200000),
    ("boot_b.img", 0x0000000030a00000, 0x0000000002000000),
    ("vendor_boot_b.img", 0x0000000032a00000, 0x0000000004000000),
    ("init_boot_b.img", 0x0000000036a00000, 0x0000000000800000),
    ("dtbo_b.img", 0x0000000037200000, 0x0000000000800000),
    ("tee_b.img", 0x0000000037a00000, 0x0000000000600000),
    ("super.img", 0x0000000038000000, 0x0000000134000000),
    ("userdata.img", 0x000000016c000000, 0x00000000614f8000),
    ("mrdump.img", 0x00000001cd4f8000, 0x0000000001000000),
    ("otp.img", 0x00000001ce4f8000, 0x0000000002b00000),
    ("flashinfo.img", 0x00000001d0ff8000, 0x0000000001000000)
]

def calculate_sha512(file_path, start, length):
    sha512_hash = hashlib.sha512()
    with open(file_path, 'rb') as f:
        f.seek(start)
        data = f.read(length)
        sha512_hash.update(data)
    return sha512_hash.hexdigest()

def print_if_diff(sha1, sha2):
    if sha1 != sha2:
        print("The difference detected")

# path to dumps to check diff in images
def compare_by_sha512(old_dump, new_dump):
    start = 0
    end = 32768

    # First 32 KB (0x0 - 0x8000)
    old_first_sha = calculate_sha512(old_dump, start, end)
    new_first_sha = calculate_sha512(new_dump, start, end)

    # Last 32 KB
    old_size = os.path.getsize(old_dump)
    new_size = os.path.getsize(new_dump)
    old_last_sha = calculate_sha512(old_dump, old_size - 32768, 32768)
    new_last_sha = calculate_sha512(new_dump, new_size - 32768, 32768)

    print("Old First 32KB SHA512:", old_first_sha)
    print("New First 32KB SHA512:", new_first_sha)
    print_if_diff(old_first_sha, new_first_sha)
    for item in partitions:
        old = calculate_sha512(old_dump, item[1], item[2])
        new = calculate_sha512(new_dump, item[1], item[2])
        print(item[0], "Old SHA512:", old)
        print(item[0], "New SHA512:", new)
        print_if_diff(old, new)
    print("Old Last 32KB SHA512:", old_last_sha)
    print("New Last 32KB SHA512:", new_last_sha)
    print("Sizes match:", old_size == new_size)
    print_if_diff(old_last_sha, new_last_sha)

if __name__ == '__main__':
    ...
