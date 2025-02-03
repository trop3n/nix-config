{ config, pkgs, lib, nix-index-database, username, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./modules/default.nix
#    ./home-packages.nix
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";

  home = {
    username = "jason";
    homeDirectory = "/home/jason";
    sessionVariables = {
      EDITOR = "hx";
      VISUAL = "hx";
      TERMINAL = "alacritty";
      LANG = "en_US.UF-8";
      FZF_CTRL_T_OPTS = "--preview 'bat -n --color=always --line-range :500 {}'";
      FZF_ALT_C_OPTS = "--preview 'eza --tree --color=always {} | head -200'";
      STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\${HOME}/.steam/root/compatibilitytools.d";
    };
  };

  # stylix home-manager
  stylix = {
    enable = true;
    targets = {
      helix.enable = true;
      gtk.enable = true;
      fish.enable = false;
      fzf.enable = true;
      kde.enable = true;
      lazygit.enable = true;
      tmux.enable = true;
      zellij.enable = true;
      waybar.enable = true;
      rofi.enable = true;
      hyprland.enable = true;
    };
  };
}