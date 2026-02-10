import os


class Global:
    imgs_folder_name = "img"
    original_folder_name = "original"
    extracted_folder_name = "extracted"
    resources_folder_name = "res"
    exec_folder_name = "exec"

    image_name = 'system.img'
    system_name = 'system.img'
    _0_system_name = '0.system.img'
    new_system_name = 'new_system.img'
    vendor_name = 'vendor.img'
    product_name = 'product.img'
    system_ext_name = 'system_ext.img'
    vbmeta_name = '0.vbmeta.img'
    super_name = '1.super.img'
    updated_folder_name = "updated"

    updated_folder_path = os.path.join(imgs_folder_name, updated_folder_name)
    updated_system_path = os.path.join(updated_folder_path, system_name)
    updated_0_system_path = os.path.join(updated_folder_path, _0_system_name)
    updated_vendor_path = os.path.join(updated_folder_path, vendor_name)
    updated_product_path = os.path.join(updated_folder_path, product_name)
    updated_system_ext_path = os.path.join(updated_folder_path, system_ext_name)
    updated_super_path = os.path.join(updated_folder_path, super_name)
    updated_image_path = os.path.join(updated_folder_path, new_system_name)
    updated_vbmeta_path = os.path.join(updated_folder_path, vbmeta_name)

    extracted_folder_path = os.path.join(imgs_folder_name, original_folder_name, extracted_folder_name)
    extracted_system_path = os.path.join(extracted_folder_path, system_name)
    extracted_vendor_path = os.path.join(extracted_folder_path, vendor_name)
    extracted_product_path = os.path.join(extracted_folder_path, product_name)
    extracted_vbmeta_path = os.path.join(extracted_folder_path, vbmeta_name)
    extracted_system_ext_path = os.path.join(extracted_folder_path, system_ext_name)
    extracted_super_path = os.path.join(extracted_folder_path, super_name)

    image_path = os.path.join(imgs_folder_name, original_folder_name, image_name)
    extracted_system_folder_path = os.path.join(extracted_folder_path, 'system')
    data_m88_pud_name = "data_M88.pud"
    data_m88_pud_path = os.path.join(resources_folder_name, data_m88_pud_name)
    data_m88_pud_img_path = os.path.join("system", "bin", data_m88_pud_name)
    lpunpack = os.path.join(exec_folder_name, 'lpunpack.exe')
    lpdump = os.path.join(exec_folder_name, 'lpdump.exe')
    lpmake = os.path.join(exec_folder_name, 'lpmake.exe')
    apktool = os.path.join(exec_folder_name, 'apktool.jar')
    signer_folder_path = os.path.join(exec_folder_name, 'signer')
    apksigner = os.path.join(signer_folder_path, "apksigner.bat")
    keystore = os.path.join(signer_folder_path, "my.keystore")
    magiskboot = os.path.join(exec_folder_name, 'magiskboot.exe')
    abe = os.path.join(exec_folder_name, "abe.jar")