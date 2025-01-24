{ pkgs, lib, ... }:
{
  programs.alacritty = {
  enable = true;
  # custom settings
  settings = {
     env.TERM = "xterm-256color";
    terminal.shell = {
      program = "fish";
      args = [ "--login" ];
    };
    font = {
      normal = {
        family = "Fantasque Sans Mono";
        style = "Regular";
      };
      bold = {
        family = "Fantasque Sans Mono";
        style = "Bold";
      };
      italic = {
        family = "Fantasque Sans Mono";
        style = "Italic";
      };
      bold_italic = {
        family = "Fantasque Sans Mono";
        style = "Bold Italic";
      };
      size = lib.mkForce 10;
       # draw_bold_text_with_bright_colors = true;
    };
    scrolling.multiplier = 5;
    selection.save_to_clipboard = true;
    # decorations.none = true;
    window.opacity = lib.mkForce 0.7;
    window.blur = true;
    };
  };
}