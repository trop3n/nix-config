{
  programs.nixvim.plugins = {

    treesitter = {
      enable = true;
      nixvimInjections = true;
      folding = true;
      indent = true;
    };

    treesitter-refactor = {
      enable = true;
      highlightDefinitions = {
        enable = true;
        # Set to false if you have an `updatetime` of ~100.
        clearOnCursorMove = false;
      };
    };

    hmts.enable = true;

    lsp = {
      enable = true;
      servers = {
        clangd.enable = true;
        pylsp.enable = true;
        html.enable = true;
        lua_ls.enable = true;
        nil_ls.enable = true;
        ts_ls.enable = true;
        marksman.enable = true;
        gopls.enable = true;
        jsonls.enable = true;
      };
    };
  };
}