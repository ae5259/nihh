{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    vial
    qemu

    git
    vim
    wget
    micro
    curl
    bat
    jujutsu
    tokei
    cloc

    rustc
    cargo
    gcc
    pkg-config
    alejandra
    zsh
    fish
    starship
    element-desktop
    fractal

    # fish plugins
    fishPlugins.done
    fishPlugins.fzf-fish
    fishPlugins.forgit
    fishPlugins.hydro
    fzf
    fishPlugins.grc
    grc

    powertop
    tlp
    resources
    deno
    zig
    gnome-screenshot
    gnome-tweaks
    gnome-extension-manager
    libinput

    video-trimmer
    cloudflare-warp
    pavucontrol
    spotiflac
    adwaita-icon-theme
    hicolor-icon-theme

    vanilla-dmz
    bibata-cursors
    thunderbird

    # Niri
    swaylock
    fuzzel
  ];
  # ++ [
  #   inputs.uchar.packages.${system}.linux
  # ];
}
