{...}: {
  programs.lite-xl = {
    enable = true;

    plugins = {
      enableList = [
        "autoinsert"
        "base16"
        "bracketmatch"
        "eofnewline"
        "formatter"
        "gitstatus"
        "linenumbers"
        "lintplus"
        "lsp"
        "nerdicons"
        "select_colorscheme"
        "tab_switcher"
        "typingspeed"

        "lite-xl-vibe" # Vim bindings
      ];

      languages.enableList = [
        "nix"
        "yaml"
        "zig"
        "rust"
        "ts"
        "json"
        "go"
        "odin"
      ];
    };
    fonts = {
      font = "FiraCodeNerdFontMono-Retina";
      codeFont = "FiraCodeNerdFontMono-Retina";
    };
  };
}
