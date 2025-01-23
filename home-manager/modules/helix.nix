{
    programs.helix = {
    enable = true;
    settings = {
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };
    languages.language = [{
      name = "nix";
      auto-format = true;
      formatter.command = lib.getExe pkgs.nixfmt-rfc-style;
    }];
    # themes = {
    #   monokai_pro_spectrum = {
    #     "inherits" = "monokai_pro";
    #     "ui.background" = { };
    #   };
    # };
  };
}