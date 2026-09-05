#!/usr/bin/zsh
git pull
sudo nixos-rebuild switch --flake .#radar

