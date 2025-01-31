{ pkgs, lib, ... }:
{
  programs.helix = {
    enable = true;
    settings = {
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };
    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = lib.getExe pkgs.nixfmt-rfc-style;
      }
        # Python
      {
        name = "python";
        auto-format = true;
        formatter.command = lib.getExe pkgs.black;
        language-servers = [ { command = lib.getExe pkgs.python3Packages.python-lsp-server; } ];
      }
      # Rust
      {
        name = "rust";
        auto-format = true;
        formatter.command = lib.getExe pkgs.rustfmt;
        language-servers = [ { command = lib.getExe pkgs.rust-analyzer; } ];
      }
      # JavaScript/TypeScript
      {
        name = "javascript";
        auto-format = true;
        formatter.command = lib.getExe pkgs.nodePackages.prettier;
        language-servers = [ { command = lib.getExe pkgs.nodePackages.typescript-language-server; } ];
      }
      {
        name = "typescript";
        auto-format = true;
        formatter.command = lib.getExe pkgs.nodePackages.prettier;
        language-servers = [ { command = lib.getExe pkgs.nodePackages.typescript-language-server; } ];
      }
      # C
      {
        name = "c";
        auto-format = true;
        formatter.command = "${pkgs.clang-tools}/bin/clang-format";
        language-servers = [ { command = "${pkgs.clang-tools}/bin/clangd"; } ];
      }
      # C++
      {
        name = "cpp";
        auto-format = true;
        formatter.command = "${pkgs.clang-tools}/bin/clang-format";
        language-servers = [ { command = "${pkgs.clang-tools}/bin/clangd"; } ];
      }
      # Ruby
      {
        name = "ruby";
        auto-format = true;
        formatter.command = lib.getExe pkgs.rubocop;
        language-servers = [ { command = lib.getExe pkgs.solargraph; } ];
      }
      # Gleam
      {
        name = "gleam";
        auto-format = true;
        formatter.command = lib.getExe pkgs.gleam;
        language-servers = [ { command = lib.getExe pkgs.gleam; args = [ "lsp" ]; } ];
      }
      # Elixir
      {
        name = "elixir";
        auto-format = true;
        formatter.command = "mix";
        formatter.args = [ "format" ];
        language-servers = [ { command = lib.getExe pkgs.elixir_ls; } ];
      }   
    ];
  };
}