{ pkgs, ... }: 

{

  system.stateVersion = "26.05";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_7_1;

  programs.ssh.enableAskPassword = false;

  networking.networkmanager.enable = true;

  time.timeZone = "Australia/Sydney";

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
    htop
    cifs-utils
    zsh
    fastfetch
    freerdp
  ];

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  programs.yazi.enable = true;

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
    };
  };

  users.users.michael = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    hashedPassword = "$6$.8loc0/Ynziw2Tt.$i4wivxWd6Y6i0X9BBEAhKSZ.w9/t5gdaXn0CFgn6CI5Y8HKEImYrle30YbxyAFW4uHcqKkzOSpI9L/B29Ff8b1";
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  fileSystems."/mnt/backup" = {
    device = "//192.168.1.240/backup";
    fsType = "cifs";
    options = let
    in [
      "credentials=/home/michael/.smb/creds,noserverino,_netdev,uid=1000,gid=100"
    ];
  };
  fileSystems."/mnt/downloads" = {
    device = "//192.168.1.240/downloads";
    fsType = "cifs";
    options = let
    in [
      "credentials=/home/michael/.smb/creds,noserverino,_netdev,uid=1000,gid=100"
    ];
  };
  fileSystems."/mnt/local" = {
    device = "//192.168.1.240/local";
    fsType = "cifs";
    options = let
    in [
      "credentials=/home/michael/.smb/creds,noserverino,_netdev,uid=1000,gid=100"
    ];
  };
  fileSystems."/mnt/michael" = {
    device = "//192.168.1.240/michael";
    fsType = "cifs";
    options = let
    in [
      "credentials=/home/michael/.smb/creds,noserverino,_netdev,uid=1000,gid=100"
    ];
  };
  fileSystems."/mnt/music" = {
    device = "//192.168.1.240/music";
    fsType = "cifs";
    options = let
    in [
      "credentials=/home/michael/.smb/creds,noserverino,_netdev,uid=1000,gid=100"
    ];
  };
  fileSystems."/mnt/photos" = {
    device = "//192.168.1.240/photos";
    fsType = "cifs";
    options = let
    in [
      "credentials=/home/michael/.smb/creds,noserverino,_netdev,uid=1000,gid=100"
    ];
  };
  fileSystems."/mnt/proxmox" = {
    device = "//192.168.1.240/proxmox";
    fsType = "cifs";
    options = let
    in [
      "credentials=/home/michael/.smb/creds,noserverino,_netdev,uid=1000,gid=100"
    ];
  };
  fileSystems."/mnt/software" = {
    device = "//192.168.1.240/software";
    fsType = "cifs";
    options = let
    in [
      "credentials=/home/michael/.smb/creds,noserverino,_netdev,uid=1000,gid=100"
    ];
  };
  fileSystems."/mnt/videos" = {
    device = "//192.168.1.240/videos";
    fsType = "cifs";
    options = let
    in [
      "credentials=/home/michael/.smb/creds,noserverino,_netdev,uid=1000,gid=100"
    ];
  };

}
