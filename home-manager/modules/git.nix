{
    programs.git = {
    enable = true;
    userName = "trop3n";
    userEmail = "jasondkimm@proton.me";
    delta.options = {
      line-numbers = true;
      side-by-side = true;
      navigate = true;
    };
    extraConfig = {
      init.defaultBranch = "main";
    #  url = {
    #    "https://oauth2:${secrets.github_token}"@github.com" = {
    #      insteadOf = "https://github.com"
    #    };
    #  };
      push = {
        default = "current";
        autoSetupRemote = true;
      };
      merge = {
        conflictstyle = "diff3";
      };
      diff = {
        colorMoved = "default";
      };
    };
  };
}