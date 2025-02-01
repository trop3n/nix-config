{
  programs.nixvim.plugins.obsidian = {
    enable = true;

    settings = {
      completion = {
        min_chars = 2;
        nvim_cmp = true;
      };
      new_notes_location = "current_dir"; # or "current_dir" if you want new notes created in the current directory
      workspaces = [
        {
          name = "Main Vault 2";
          path = "~/Documents/Main Vault 2";
        }
      ];
      templates = {
        date_format = "%Y-%m-%d";
        subdir = "04-templates";
      };
      attachments = {
        img_folder = "01-assets";
      };
      disable_frontmatter = true;
    };
  };
}