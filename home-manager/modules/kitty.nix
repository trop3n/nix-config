{
  home.file = {
    ".config/kitty/kitty.conf".text = ''
      font_family      Cascadia Code
      bold_font        auto
      italic_font      auto
      bold_italic_font auto
      font_size        18.0
      disable_ligatures never
      clipboard_control write-clipboard write-primary no-append

      shell tmux
      editor nvim
      enable_audio_bell no

      map ctrl+shift+l send_text all clear\n

      foreground #a0a8b6
      # background #1d252c
      # background #2a343d
      background #3a4654

      color0  #2a343d
      color1  #ff5874
      color2  #a8d1a5
      color3  #ffcc99
      color4  #9cd1be
      color5  #c792ea
      color6  #82aaff
      color7  #c0c8d6

      color8  #4C566A
      color9  #BF616A
      color10  #94E2D5
      color11 #EBCB8B
      color12 #81A1C1
      color13 #82aaff
      color14 #c792ea
      color15 #d6deeb
    '';
  };
}