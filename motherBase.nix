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


	# Allow Unfree
	nixpkgs.config.allowUnfree = true;
	
  environment.systemPackages = with pkgs; [
		git	
		qutebrowser
		keepassxc
		vim
		emacs
		syncthing
	]; 

  # X11
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbVariant = "altgr-intl";
  services.xserver.xkbOptions = "caps:escape";

	# Pulseaudio
	hardware.pulseaudio.enable = true;

	# Syncthing
	services.syncthing = {
	  enable = true;
	  user = "samcheung";
		dataDir = "/home/samcheung/Syncthing";
	};
}

