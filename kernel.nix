{
  lib,
  pkgs,
  inputs,
  ...
}:

{
  boot.kernelPackages = pkgs.linuxPackagesFor (
    pkgs.buildLinux {
      version = "6.1.115-radxa";
      modDirVersion = "6.1.115";
      src = inputs.radxa-kernel;
      defconfig = "rockchip_linux_defconfig";
      dtbs = [ "rockchip/rk3588-rock-5b-plus.dtb" ];

      structuredExtraConfig = with lib.kernel; {
        ACPI_APEI = lib.mkForce unset;
        ACPI_APEI_GHES = lib.mkForce unset;
        ACPI_FPDT = lib.mkForce unset;
        ACPI_HMAT = lib.mkForce unset;
        ACPI_HOTPLUG_CPU = lib.mkForce unset;
        ACPI_HOTPLUG_MEMORY = lib.mkForce unset;
        CC_OPTIMIZE_FOR_SIZE = lib.mkForce unset;
        CGROUP_HUGETLB = lib.mkForce unset;
        CHROMEOS_TBMC = lib.mkForce unset;
        DRM_VBOXVIDEO = lib.mkForce unset;
        DRM_VC4_HDMI_CEC = lib.mkForce unset;
        FSL_MC_UAPI_SUPPORT = lib.mkForce unset;
        HOTPLUG_PCI_ACPI = lib.mkForce unset;
        KEXEC_JUMP = lib.mkForce unset;
        MT7986_WMAC = lib.mkForce unset;
        NET_VENDOR_MEDIATEK = lib.mkForce unset;
        PARAVIRT_SPINLOCKS = lib.mkForce unset;
        PCI_XEN = lib.mkForce unset;
        PERF_EVENTS_AMD_BRS = lib.mkForce unset;
        PINCTRL_AMD = lib.mkForce unset;
        SCHED_CORE = lib.mkForce unset;
        SUN8I_DE2_CCU = lib.mkForce unset;
        VBOXGUEST = lib.mkForce unset;
        XEN_HAVE_PVMMU = lib.mkForce unset;
        XEN_MCE_LOG = lib.mkForce unset;
        XEN_PVH = lib.mkForce unset;
        XEN_PVHVM = lib.mkForce unset;
        XEN_SAVE_RESTORE = lib.mkForce unset;
        # ARCH_BCM2835 = lib.mkForce unset;
        # BCM2835_MBOX = lib.mkForce unset;
        # BCM2835_WDT = lib.mkForce unset;
        # PCI_TEGRA = lib.mkForce unset;
        # RASPBERRYPI_FIRMWARE = lib.mkForce unset;
        # RASPBERRYPI_POWER = lib.mkForce unset;
        # SERIAL_8250_BCM2835AUX = lib.mkForce unset;
        # USB_XHCI_TEGRA = lib.mkForce unset;
      };

	  # suppress warnings from lib.systems.platforms.aarch64-multiplatform because it doesnt let you override linux-kernel.extraConfig
	  # https://github.com/hsjobeki/nixpkgs/blob/master/lib/systems/platforms.nix#L359
      # ignoreConfigErrors = true;
    }
  );
}
