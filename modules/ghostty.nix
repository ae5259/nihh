{ ... }:
{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    installVimSyntax = true;
    settings = {
      font-family = "Iosevka";
      # font-family = "SF Mono";
    };
  };
}
