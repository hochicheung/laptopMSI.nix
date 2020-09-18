{ config, pkgs, ... }:

{
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

  networking.hostName = "MotherBase"; 

  # X11
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbVariant = "altgr-intl";
  services.xserver.xkbOptions = "caps:escape";

	# Pulseaudio
	hardware.pulseaudio.enable = true;

	# Allow Unfree
	nixpkgs.config.allowUnfree = true;
	
  environment.systemPackages = [
				pkgs.qutebrowser
				pkgs.rclone
				pkgs.discord
				pkgs.mupdf
				pkgs.keepassxc
	]; 
}

