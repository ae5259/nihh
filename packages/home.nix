{
  inputs,
  pkgs,
  ...
}: let
  system = pkgs.stdenv.hostPlatform.system;
  nixpkgs-unstable = import inputs.nixpkgs-unstable {inherit system;};
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
      eza # A modern replacement for ‘ls’
      fzf # A command-line fuzzy finder

      figma-linux # figma
      onefetch # neofetch for git repository
      microfetch # minimal neofetch
      fastfetch # fast neofetch
      netcat
      nix-output-monitor

      # productivity
      glow # markdown previewer in terminal
      putty

      btop # replacement of htop/nmon
      discord # same with yandex
      yazi # terminal vile explorer
      ffmpeg # shame on you if you don't know it
      yt-dlp # youtube video downloader
      obs-studio # video recorder
      feh # lightweight image viewer
      swaybg # wallpaper tool for wayland compositors

      prismlauncher
      jre
      mpv

      qbittorrent

      spek
      gnome-power-manager
      ngrok
      bruno

      tigervnc
      # mullvad-vpn
    ]
    ++ (with nixpkgs-unstable; [
      ayugram-desktop
      telegram-desktop
    ]);
}
