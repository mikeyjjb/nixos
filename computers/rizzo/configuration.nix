{ config, pkgs, lib, ... }: 

{
  boot.initrd.kernelModules = [ "i915" ];

  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "rizzo";

  environment.systemPackages = with pkgs; [
   alacritty
   discord
   kdePackages.krdc
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "discord"
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

  services = {
    desktopManager.plasma6.enable = true;
    displayManager.plasma-login-manager.enable = true;
  };

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    kate
    gwenview
    okular
    elisa
    konsole
    kwalletmanager
    ark
    qrca
    spectacle
  ];

  services.xserver.videoDrivers = [ "modesetting" ];

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "i965";
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-vaapi-driver
      libvdpau-va-gl
    ];
  };

  hardware.enableRedistributableFirmware = true;

  programs.firefox.enable = true;

}
