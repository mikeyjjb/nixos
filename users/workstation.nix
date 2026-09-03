{ pkgs, ... }: {
  imports = [ ./michael.nix ];

  programs.vim = {
    enable = true;
    extraConfig = ''
      set number
    '';
  };

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 16.0;
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Italic";
        };
      };
    };
  }; 

}
