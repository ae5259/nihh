{
  inputs,
  pkgs,
  ...
}: let
  system = pkgs.stdenv.hostPlatform.system;
in {
  home.packages = with pkgs;
    [
      # archives
      zip
      xz
      unzip
      p7zip

      # utils
      ripgrep # recursively searches directories for a regex pattern
      jq # A lightweight and flexible command-line JSON processor
      yq-go # yaml processor https://github.com/mikefarah/yq
      eza # A modern replacement for ‘ls’
      fzf # A command-line fuzzy finder
      fd

      figma-linux # figma
      onefetch # neofetch for git repository
      microfetch # minimal neofetch
      fastfetch # fast neofetch
      netcat
      tmux
      # neofetch # neofetch
      # nix related
      # it provides the command `nom` works just like `nix`
      # with more details log output
      nix-output-monitor

      # productivity
      glow # markdown previewer in terminal
      putty

      btop # replacement of htop/nmon

      zoxide # for faster navigation
      discord # same with yandex
      yazi # terminal vile explorer
      ffmpeg # shame on you if you don't know it
      yt-dlp # youtube video downloader
      obs-studio # video recorder
      feh # lightweight image viewer
      swaybg # wallpaper tool for wayland compositors
      gradia # screenshot tool

      prismlauncher
      jre
      mpv

      qbittorrent

      spek
      gnome-power-manager
      ngrok
      bruno

      tigervnc
      ayugram-desktop
    ]
    ++ (with inputs; [
      # ayugram.packages.${system}.ayugram-desktop
    ]);
}
