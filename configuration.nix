# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
			./laptopMSI.nix
    ];

  # Use the systemd-boot EFI boot loader.
  # boot.loader.systemd-boot.enable = true;

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
			efiSysMountPoint = "/boot";
		};
		grub = {
		  devices = [ "nodev" ];
			efiSupport = true;
			enable = true;
			version = 2;
			useOSProber = true;
		};
	};

	# Os-Prober, dual booting
	# boot.loader.grub.enable = true;
	# boot.loader.grub.version = 2;
	# boot.loader.grub.device = "/dev/sdb";

	# Don't use swap unless ram is full
	boot.kernel.sysctl = {
  	"vm.swappiness" = 0;
	};
	services.fstrim.enable = true;

	# Clean /tmp on boot
	boot.cleanTmpDir = true;

	# Time & Date
	time.timeZone = "Europe/Stockholm";
	services.localtime.enable = true;
  
  # Networking
  networking.networkmanager.enable = true;
  networking.useDHCP = false;

  # User Management
  users.users.samcheung = {
    isNormalUser = true;
    home = "/home/samcheung";
    extraGroups = ["wheel" "networkmanager" "video"];
  };
  
  # Packages
  environment.systemPackages = [
				pkgs.git
				pkgs.vim
				pkgs.emacs
	]; 

	# Nix garbage collector
	nix.gc.automatic = true;

	# X Window-manager
  services.xserver.autorun = false;
  services.xserver.windowManager.exwm.enable = true;
 	services.xserver.desktopManager.xterm.enable = true;

	system.autoUpgrade.enable = true;
	system.autoUpgrade.allowReboot = true;

  system.stateVersion = "20.03";
}

