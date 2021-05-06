{ config, pkgs, ... }:

{
	# Use the systemd-boot EFI boot loader.
	boot.loader.systemd-boot.enable = true;

	networking.hostName = "MSILaptop";

	# Allow Unfree
	nixpkgs.config.allowUnfree = true;

	environment.systemPackages = with pkgs; [
		git
		chromium
		keepassxc
		vim
		emacs
		light
	];

	# Backlight control
	programs.light.enable = true;

	# Touchpad
	services.xserver.libinput.enable = true;
	services.xserver.libinput.touchpad.tapping = true;
	services.xserver.libinput.touchpad.disableWhileTyping  = true;

	# X11
	services.xserver.enable = true;
	services.xserver.layout = "us";
	services.xserver.xkbVariant = "altgr-intl";
	services.xserver.xkbOptions = "caps:escape";

	# Pulseaudio
	hardware.pulseaudio.enable = true;
}
