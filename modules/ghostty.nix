{ ... }:
{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    installVimSyntax = true;
    settings = {
      font-family = "Iosevka";
      # font-family = "SF Mono";

      keybind = [
        "alt+h=goto_split:left"
        "alt+l=goto_split:right"

        "alt+j=previous_tab"
        "alt+k=next_tab"

        "alt+g=toggle_window_decorations"
      ];
    };
  };
}
