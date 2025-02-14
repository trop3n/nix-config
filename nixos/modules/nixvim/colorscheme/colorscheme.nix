{ config, pkgs, lib, ... }:
let
  colors = import ./colors/citylights.nix;
in
{
  colorschemes.base16 = {
    enable = true;
    setUpBar = true;
    colorscheme = colors;
    settings = {
      cmp = true;
      illuminate = true;
      indentblankline = true;
      lsp_semantic = true;
      mini_completion = true;
      telescope = true;
      telescope_borders = false;
    };
  };
}