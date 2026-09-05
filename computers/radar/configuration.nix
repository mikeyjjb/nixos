{ config, pkgs, lib, ... }: 

{

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --cmd start-hyprland";
        user = "michael";
      };
    };
  };

  boot.kernelParams = [ "nvidia-drm-fbdev=1" ];

  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "radar";

  environment.systemPackages = with pkgs; [
   alacritty
   discord
   pavucontrol
   alsa-utils
   rofi
   kitty
   waytrogen
   freerdp
   hyprpaper
   gimp
   bulky
   ueberzugpp
   fd
   _7zz
 ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "nvidia-kernel-modules"
    "nvidia-x11"
    "nvidia-settings"
    "nvidia-persistenced"
    "discord"
    "unrar"
  ];

  powerManagement.enable = false;
  systemd.sleep.settings.Sleep = {
    AllowSuspend = "no";
    AllowHibernation = "no";
    AllowHybridSleep = "no";
    AllowSuspendThenHibernate = "no";
  };
  systemd.targets.sleep.enable = false;
  systemd.targets.suspend.enable = false;
  systemd.targets.hibernate.enable = false;
  systemd.targets.hybrid-sleep.enable = false;

  services.xserver.videoDrivers = ["nvidia"];

  programs.hyprland.enable = true;
  programs.waybar.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };  

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
};

  programs.firefox.enable = true;

}
