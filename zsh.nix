{ config, pkgs, ... }:

let
  flakePath = "~/.config/nix/";
in
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "z"
      ];
      theme = "robbyrussell";
    };
    shellAliases = {
      ll = "ls -l";
      la = "ls -a";
      ".." = "cd ..";
      ff = "fastfetch";
      nix-rebuild = "sudo nixos-rebuild switch --flake ${flakePath}/#x280";
      nix-clean = "sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations old && nix-collect-garbage -d";
    };
    history.size = 10000;
    history.ignoreAllDups = true;
    history.path = "$HOME/.zsh_history";
    history.ignorePatterns = ["rm *" "pkill *" "cp *"];
    setOptions = [
      "HIST_IGNORE_ALL_DUPS"
    ];
  };
}