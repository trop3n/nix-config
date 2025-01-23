{
    programs.starship = {
    enable = true;
    enableZshIntegration = false;
    enableBashIntegration = false;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
      git_branch.style = "242";
      directory.style = "blue";
      directory.truncate_to_repo = false;
      directory.truncation_length = 8;
      hostname.style = "bold cyan";
      username = {
        style_user = "green bold";
        style_root = "blue bold";
      };
    };
  };
}