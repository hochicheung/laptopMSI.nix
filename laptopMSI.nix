{ config, pkgs, ... }:

{
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;

  networking.hostName = "MSILaptop"; 

	# Allow Unfree
	nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
		git	
		qutebrowser
		keepassxc
		vim
		emacs
		light
		syncthing
	];

	#fonts.fonts = with pkgs; [
	  #(nerdfonts.override {fonts = [ "FiraCode" "3270" "ProggyClean"]; })
		#noto-fonts
		#noto-fonts-cjk
		#fira-code
	#];

	# Backlight control
	programs.light.enable = true;

  # Touchpad
  services.xserver.libinput.enable = true;
  services.xserver.libinput.tapping = true;
	services.xserver.libinput.disableWhileTyping = true;
 
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
