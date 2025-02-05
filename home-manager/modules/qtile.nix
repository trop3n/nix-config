{ config, pkgs, ... }:

{
  # Enable Qtile (X11 or Wayland)
  services.qtile = {
    enable = true;
    backend = "x11"; # or "wayland" (experimental)
    # Optional: Include extra packages like widgets
    extraPackages = python3Packages: with python3packages; [
      qtile-extras
      # Other dependencies (e.g., for widgets)
    ];
  };

  # Optional: Configure Qtile (replace with your config path)
  # xdg.configFile."qtile/config.py".source = ./path/to/your/qtile/config.py;
}