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

  # Allow unfree, nvidia drivers
  nixpkgs.config.allowUnfree = true;

	# Don't use swap unless ram is full
	boot.kernel.sysctl = {
  	"vm.swappiness" = 0;
	};
	services.fstrim.enable = true;

<<<<<<< HEAD
  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  # networking.interfaces.enp3s0.useDHCP = true;
  # networking.interfaces.wlp2s0.useDHCP = true;
=======
	# Clean /tmp on boot
	boot.cleanTmpDir = true;
>>>>>>> github/master

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

<<<<<<< HEAD
  # Touchpad
  # services.xserver.libinput.enable = true;
  # services.xserver.libinput.tapping = false;
 
  # X11
  services.xserver.enable = true;
  services.xserver.videoDrivers = ["nvidia"];
  services.xserver.layout = "us";
  services.xserver.xkbVariant = "altgr-intl";
  services.xserver.xkbOptions = "caps:escape"; 
=======
	# Nix garbage collector
	nix.gc.automatic = true;
>>>>>>> github/master

	# X Window-manager
  services.xserver.autorun = false;
  services.xserver.windowManager.exwm.enable = true;
 	services.xserver.desktopManager.xterm.enable = true;

	system.autoUpgrade.enable = true;
	system.autoUpgrade.allowReboot = true;

  system.stateVersion = "20.03";
}

