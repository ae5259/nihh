{pkgs, ...}: {
  fonts = {
    fontDir.enable = true;
    enableDefaultPackages = true;
    packages = with pkgs; [
      liberation_ttf
      times-newer-roman
      ubuntu-classic
      noto-fonts
      noto-fonts-color-emoji
      noto-fonts-cjk-sans
      jetbrains-mono
      nerd-fonts.jetbrains-mono
      nerd-fonts.fira-code
      nerd-fonts.droid-sans-mono
      nerd-fonts.noto

      hack-font
      font-awesome
      iosevka
    ];

    fontconfig = {
      defaultFonts = {
        serif = ["Times Newer Roman"];
        sansSerif = ["Noto Sans"];
        monospace = ["Iosevka"];
      };
    };
  };
}
