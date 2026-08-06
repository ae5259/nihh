{pkgs, ...}: {
  programs.kitty = {
    enable = true;

    themeFile = "adwaita_darker";

    settings = {
      cursor_trail = 3;
      background_blur = 1;
    };

    font = {
      name = "Maple Mono Medium";
      package = pkgs.maple-mono.truetype;
    };
  };
}
