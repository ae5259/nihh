{
  pkgs,
  inputs,
  ...
}: let
  system = pkgs.stdenv.hostPlatform.system;
  nixpkgs-unstable = import inputs.nixpkgs-unstable {inherit system;};
in {
  environment.systemPackages = with pkgs;
    [
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
    ]
    ++ (with nixpkgs-unstable; [
      flameshot
    ]);
}
