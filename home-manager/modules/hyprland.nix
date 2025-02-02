{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./hyprland.conf;
  };

  home.packages = with pkgs; [
    hyprpaper
    waybar
    mako
    swaylock-effects
    wofi
    swayidle
    swaylock-effects
    wlogout
    wl-clipboard
    qt5.qtwayland
    qt6.qtwayland
  ];
}