{
  programs.ghostty = {
    enable = true;
    settings = {
      initial-command = "zsh";
      font-family = "Lilex Nerd Font Mono";
      font-size = 10;
      theme = "SoftServer";
      mouse-hide-while-typing = true;
      mouse-scroll-multiplier = 2;
      window-padding-balance = true;
      window-save-state = "always";
      window-colorspace = "display-p3";
      window-decoration = true;
      background-opacity = 0.9;
      background = "1d252c";
      cursor-style = "block";
      keybind = "ctrl+w=toggle_window_decorations";
    };      
  };
}