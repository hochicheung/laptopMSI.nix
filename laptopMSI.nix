{ config, pkgs, ... }:

{
  networking.hostName = "MSILaptop"; 

  networking.interfaces.enp3s0.useDHCP = true;
  networking.interfaces.wlp2s0.useDHCP = true;

  # Touchpad
  services.xserver.libinput.enable = true;
  services.xserver.libinput.tapping = true;
 
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
				pkgs.python3
				pkgs.discord
	]; 
}
