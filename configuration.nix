{ config, pkgs, ... }:

{
	imports =
		[
			./hardware-configuration.nix
			./laptopMSI.nix
		];

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

	# User Management
	users.users.samcheung = {
		isNormalUser = true;
		home = "/home/samcheung";
		extraGroups = ["wheel" "networkmanager" "video"];
	};
	users.users.localtimed.group = "localtimed";
	users.groups.localtimed = {};

	# Nix garbage collector
	nix.gc.automatic = true;

	# X Window-manager
	services.xserver.windowManager.exwm.enable = true;
		services.xserver.desktopManager.xterm.enable = true;
	services.xserver.autorun = true;

	system.autoUpgrade.enable = true;
	system.autoUpgrade.allowReboot = false;
}
