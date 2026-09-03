{ pkgs, ... }: {
  imports = [ ./michael.nix ];

  programs.vim = {
    enable = true;
    extraConfig = ''
      set number
    '';
  };

}
