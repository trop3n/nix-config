{ config, pkgs, ... }: {
  programs.plasma = {
    enable = true;
    configFile."plasma-org.kde.plasma.desktop-appletsrc" = {
      # Adjust containment IDs (e.g., 0, 1, 2) for each monitor
      "Containments][0" = {
        location = "bottom";
        alignment = "center";
        length = "0.3";
        screen = 0; # Monitor ID (check via `xrandr`)
      };
      "Containments][1" = {
        location = "bottom";
        alignment = "center";
        length = "0.3";
        screen = 1;
      };
      "Containments][2" = {
        location = "bottom";
        alignment = "center";
        length = "0.3";
        screen = 2;
      };
    };
  };
}