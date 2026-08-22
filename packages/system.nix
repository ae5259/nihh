{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    vial

    git
    vim
    curl
    bat
    tokei

    starship
    element-desktop

    # fish plugins
    fishPlugins.done
    fishPlugins.fzf-fish
    fishPlugins.forgit
    fishPlugins.hydro
    fzf
    fishPlugins.grc
    grc

    resources
    gnome-screenshot
    gnome-tweaks
    gnome-extension-manager
    libinput

    video-trimmer
    cloudflare-warp
    pavucontrol
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
