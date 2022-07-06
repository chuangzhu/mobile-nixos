{ pkgs, ... }:

{
  mobile.device.name = "oneplus-oneplus6";
  mobile.device.identity = {
    name = "OnePlus 6";
    manufacturer = "OnePlus";
  };

  mobile.hardware = {
    soc = "qualcomm-sdm845";
    ram = 1024 * 0/* (in MB) To be filled by the user */;
    screen = {
      width = 0/* To be filled by the user */;
      height = 0/* To be filled by the user */;
    };
  };

  mobile.boot.stage-1 = {
    kernel.package = pkgs.callPackage ./kernel { };
  };

  mobile.device.firmware = pkgs.callPackage ./firmware { };

  mobile.system.android.device_name = "OnePlus6";
  mobile.system.android = {
    # This device has an A/B partition scheme.
    ab_partitions = true;

    bootimg.flash = {
      offset_base = "0x00000000";
      offset_kernel = "0x00008000";
      offset_ramdisk = "0x01000000";
      offset_second = "0x00f00000";
      offset_tags = "0x00000100";
      pagesize = "4096";
    };
  };

  mobile.system.vendor.partition = "/dev/disk/by-partlabel/vendor_a";

  boot.kernelParams = [
    # Extracted from an Android boot image
    "androidboot.hardware=qcom"
    "androidboot.console=ttyMSM0"
    "video=vfb:640x400,bpp=32,memsize=3072000"
    "msm_rtb.filter=0x237"
    "ehci-hcd.park=3"
    "lpm_levels.sleep_disabled=1"
    "service_locator.enable=1"
    "swiotlb=2048"
    "androidboot.configfs=true"
    "loop.max_part=7"
    "androidboot.usbcontroller=a600000.dwc3"
    "rootwait"
    "ro"
    "init=/init"
    "buildvariant=user"
  ];

  mobile.system.type = "android";

  mobile.usb.mode = "gadgetfs";

  /* To be changed by the author, though those may or may work with any device. */
  # Google
  mobile.usb.idVendor = "18D1";
  # "Nexus 4"
  mobile.usb.idProduct = "D001";

  mobile.usb.gadgetfs.functions = {
    adb = "ffs.adb";
    /* This rndis gadget has been auto-detected. */
    rndis = "gsi.rndis";
  };

}
