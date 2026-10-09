{ config, pkgs, ... }:

let
  flakePath = "~/.config/nix/flake.nix";
in
{
  programs.bash = {
    enable = true;

    shellAliases = {
      ll = "ls -l";
      la = "ls -a";
      ".." = "cd ..";
      ff = "fastfetch";
      nix-rebuild = "sudo nixos-rebuild switch --flake ${flakePath}/#x280";
      nix-clean = "sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations old && nix-collect-garbage -d";
    };
    profileExtra = ''
      if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
	exec start-hyprland
      fi
    '';
  };
}
