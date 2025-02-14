{
  xdg.configFile."zed/settings.json".text = builtins.toJSON {
    ui_font_size = 13;
    buffer_font_size = 13;
    buffer_font_family = "mononoki";
    load_direnv = "direct";
    theme = {
      mode = "dark";
      light = "City Lights";
      dark = "City Lights";
    };
    terminal = {
      alternate_scroll = "off";
      blinking = "terminal_controlled";
      copy_on_select = true;
      dock = "right";
      detect_venv = {
        on = {
          directories = [".env" "env" ".venv" "venv"];
          activate_script = "default";
        };
      };
      env = {
        TERM = "xterm-256color";
      };
      font_family =  "RecMonoLinear Nerd Font Mono";
      font_size = 13;
      shell = {
        program = "fish";
      };
    };
  };
}