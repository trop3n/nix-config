{
  imports = [
    ./opts.nix
    ./keymaps.nix
    ./autocmds.nix
    # ./file_types.nix
    ./plugins/all.nix
    # ./colorscheme/colorscheme.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    # colorschemes.nightfox.enable = false;
    # colorschemes.nightfox.flavor = "nordfox"
    # colorschemes.catppuccin.enable = true;
    # colorschemes.dracula-nvim.enable = true;
    # colorschemes.nightfox.flavor = "duskfox";
    # colorschemes.poimandres.enable = true;
  };
}