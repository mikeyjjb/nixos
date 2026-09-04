{ config, pkgs, ... }:

{

  home.username = "michael";
  home.homeDirectory = "/home/michael";
  home.file = {
    "/home/michael/.smb/creds" = {
    text = ''
      username=michael
      password=0nthebible
      domain=home
    '';
    };
  };
  home.stateVersion = "26.05";
  
  programs.zsh = {
    enable = true;
    shellAliases = {
      buildradar = "sudo nixos-rebuild switch --flake .#radar";
      buildrizzo = "sudo nixos-rebuild switch --flake .#rizzo";
    };
    initContent = ''
      unset SSH_ASKPASS
      unset GIT_ASKPASS
      export SSH_ASKPASS_REQUIRE=never
      autoload -Uz vcs_info
      zstyle ':vcs_info:*' enable git
      zstyle ':vcs_info:git:*' formats '[%F{yellow}%b%f]'
      precmd() { vcs_info }
      setopt PROMPT_SUBST
      PROMPT='(%F{magenta}%D{%d/%m/%y %H:%M:%S}%f) %F{cyan}%n%f@%F{cyan}%m%f in %F{2}%~%f %F{red}%#%f ''${vcs_info_msg_0_} >> '
    '';
  };
}  
