{ pkgs, ... }: {
  imports = [ ./michael.nix ];

  home.file.".config/hypr" = {
    source = ../applications/hyprland;
    recursive = true;
  };

  home.file.".config/waybar" = {
    source = ../applications/waybar;
    recursive = true;
  };

  home.file.".config/kitty" = {
    source = ../applications/kitty;
    recursive = true;
  };

  services.hyprpaper = {
    enable = true;
  };

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
