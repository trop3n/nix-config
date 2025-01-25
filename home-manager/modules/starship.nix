{
    programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = false;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
      username = {
        style_user = "green bold";
        style_root = "blue bold";
        show_always = true;
        format = "[$user]($style_user)";
      };
      hostname = {
        style = "bold cyan";
        ssh_only = false;
        format = "@[$hostname]($style) ";
      };
      git_branch.style = "242";
      directory.style = "blue";
      directory.truncate_to_repo = false;
      directory.truncation_length = 8;
      directory.format = "[$path]($style) ";
    };
  };
}