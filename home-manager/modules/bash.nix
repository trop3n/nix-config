{ pkgs, ...}:
{
  programs.bash = {
    enable = true;
    enableCompletion = true;
#    plugins = [ pkgs.bashHighlight ];

    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
      if [ -f ${pkgs.blesh}/share/blesh/ble.sh ]; then
        source ${pkgs.blesh}/share/blesh/ble.sh
      fi
    '';

    initExtra = ''
      [ -f "${pkgs.fzf}/share/fzf/shell/key-bindings.bash" ] && source "${pkgs.fzf}/share/fzf/shell/key-bindings.bash"
      [ -f "${pkgs.fzf}/share/fzf/shell/completion.bash" ] && source "${pkgs.fzf}/share/fzf/shell/completion.bash"
    '';

    # set some aliases, feel free to add more or remove some
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
  };
}