import os
import re
import struct
import subprocess

from src.CMD import CMD
from src.Global import Global


class SuperTool:

    @staticmethod
    def lpunpack_image(image_path, result_folder_path):
        os.makedirs(result_folder_path, exist_ok=True)
        cmd_line = [Global.lpunpack, image_path, result_folder_path]
        CMD.run(cmd_line)

    @staticmethod
    def unpack_super():
        cmd_line = [Global.lpunpack, Global.extracted_super_path, Global.extracted_folder_path]
        CMD.run(cmd_line)

    @staticmethod
    def get_partition_offset(super_img_path, partition_name, sector_size=512):
        try:
            result = subprocess.run(
                [Global.lpdump, super_img_path],
                capture_output=True,
                text=True,
                check=True
            )
            output = result.stdout

            pattern = re.compile(rf'Name: {partition_name}.*?Extents:\s*0 \.\. (\d+) linear super (\d+)', re.DOTALL)
            match = pattern.search(output)

            if match:
                num_sectors, start_sector = map(int, match.groups())
                byte_offset = start_sector * sector_size
                return byte_offset
            else:
                print(f"Partition '{partition_name}' not found in output.")
                return -1

        except subprocess.CalledProcessError as e:
            print("lpdump failed:", e.stderr)
            return -1
        except FileNotFoundError:
            print("lpdump not found.")
            return -1

    # Unpack files to updated folder
    @staticmethod
    def unpack_super_to_updated():
        cmd_line = [Global.lpunpack, Global.extracted_super_path, Global.updated_folder_path]
        CMD.run(cmd_line)

    # original_super_path - to calculate exact size
    @staticmethod
    def pack_super_m88(product_a_path, product_b_path, system_a_path, system_b_path, vendor_a_path, vendor_b_path, original_super_path, result_super_path):
        full_size = os.path.getsize(original_super_path)
        max_group_size = full_size - 4096 * 512
        meta_data_size = 65536
        slots = 3

        product_a_size = os.path.getsize(product_a_path)
        product_b_size = os.path.getsize(product_b_path)

        system_a_size = os.path.getsize(system_a_path)
        system_b_size = os.path.getsize(system_b_path)

        vendor_a_size = os.path.getsize(vendor_a_path)
        vendor_b_size = os.path.getsize(vendor_b_path)

        cmd_pack_super = [
            Global.lpmake,
            "--metadata-size", str(meta_data_size),
            "--super-name", "super",
            "--metadata-slots", str(slots),
            "--virtual-ab",
            "--device", f"super:{full_size}",
            "--group", f"main_a:{max_group_size}",
            "--group", f"main_b:{max_group_size}",

            "--partition", f"product_a:readonly:{product_a_size}:main_a",
            "--image", f"product_a={product_a_path}",
            "--partition", f"product_b:readonly:{product_b_size}:main_b",
            "--image", f"product_b={product_b_path}",

            "--partition", f"system_a:readonly:{system_a_size}:main_a",
            "--image", f"system_a={system_a_path}",
            "--partition", f"system_b:readonly:{system_b_size}:main_b",
            "--image", f"system_b={system_b_path}",

            "--partition", f"vendor_b:readonly:{vendor_b_size}:main_b",
            "--image", f"vendor_b={vendor_b_path}",
            "--partition", f"vendor_a:readonly:{vendor_a_size}:main_a",
            "--image", f"vendor_a={vendor_a_path}",

            "--output", result_super_path
        ]
        CMD.run(cmd_pack_super)

    @staticmethod
    def pack_super():
        vendor_size = os.path.getsize(Global.updated_vendor_path)
        system_ext_size = os.path.getsize(Global.updated_system_ext_path)
        product_size = os.path.getsize(Global.updated_product_path)
        system_size = os.path.getsize(Global.updated_system_path)

        main_size = vendor_size + system_ext_size + product_size + system_size

        metadata_size = '65536'
        slots = '2'
        group_name = 'emulator_dynamic_partitions'
        full_size = os.path.getsize(Global.extracted_super_path)
        cmd_pack_super = [
            Global.lpmake,
            '--metadata-size', metadata_size,
            '--super-name', 'super',
            '--metadata-slots', slots,
            '--device', f'super:{full_size}',
            '--group', f'{group_name}:{main_size}',
            '--partition', f'system:readonly:{system_size}:{group_name}',
            '--image', f'system={Global.updated_system_path}',
            '--partition', f'system_ext:readonly:{system_ext_size}:{group_name}',
            '--image', f'system_ext={Global.updated_system_ext_path}',
            '--partition', f'product:readonly:{product_size}:{group_name}',
            '--image', f'product={Global.updated_product_path}',
            '--partition', f'vendor:readonly:{vendor_size}:{group_name}',
            '--image', f'vendor={Global.updated_vendor_path}',
            '--output', f'{Global.updated_super_path}'
        ]
        CMD.run(cmd_pack_super)

if __name__ == '__main__':
    SuperTool.unpack_super()