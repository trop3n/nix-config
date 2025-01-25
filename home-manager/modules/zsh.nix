{ pkgs, lib, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    plugins = [
        {
          name = "zsh-async";
          file = "async.zsh";
          src = pkgs.fetchFromGitHub {
            owner = "mafredri";
            repo = "zsh-async";
            rev = "a66d76f8404bd9e7a26037640e6c892cf5871ff4";
            sha256 = "sha256-Js/9vGGAEqcPmQSsumzLfkfwljaFWHJ9sMWOgWDi0NI=";
          };
        }
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.7.1";
          sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
        };
      }
      {
        name = "geometry";
        file = "geometry.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "geometry-zsh";
          repo = "geometry";
          rev = "fdff57bde4afb43beda73a14dea7738961f99bc2";
          sha256 = "D7WJJQIlAEs+ilWvQaZzmJJJ25hdkAf+nttG5Fhddgo=";
        };
      }
    ];
    oh-my-zsh = {
      enable = true;
      plugins = [
         "docker"
         "kubectl"
         "git"
         "fzf"
         "flutter"
         "direnv"
         "pip"
         "poetry"
         "python"
         "rust"
#         "starship"
         "sudo"
         "zoxide"
         "nmap"
      ];
    };
    shellAliases = {
      k = "kubectl";
      urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
      urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
      ls = "exa --icons";
      l = "exa --icons -lh";
      ll = "exa --icons -lah";
      la = "exa --icons -A";
      lm = "exa --icons -m";
      lr = "exa --icons -R";
      lg = "exa --icons -l --group-directories-first";
      gcl = "git clone --depth 1";
      gi = "git init";
      ga = "git add";
      gc = "git commit -m";
      gp = "git push origin master";
    };
    initExtra = ''
    # Configure Geometry prompt plugins
      GEOMETRY_PROMPT_PLUGINS=(exec_time git)
      autoload -Uz promptinit && promptinit
      prompt geometry
      # History options
      HISTSIZE="10000"
      SAVEHIST="10000"
      HISTFILE="$HOME/.zsh_history"
      mkdir -p "$(dirname "$HISTFILE")"

      setopt HIST_FCNTL_LOCK
      unsetopt APPEND_HISTORY
      setopt HIST_IGNORE_DUPS
      unsetopt HIST_IGNORE_ALL_DUPS
      setopt HIST_IGNORE_SPACE
      unsetopt HIST_EXPIRE_DUPS_FIRST
      setopt SHARE_HISTORY
      unsetopt EXTENDED_HISTORY
    '';
  };
}