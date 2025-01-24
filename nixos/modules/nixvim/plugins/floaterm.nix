{
  programs.nixvim.plugins.floaterm = {
    enable = true;
    settings = {
      width = 0.8;
      height = 0.8;
      shell = "/home/bluecosmo/.nix-profile/bin/bash";
      title = "";
      keymaps_toggle = "<C-b>";
    };
  };
}