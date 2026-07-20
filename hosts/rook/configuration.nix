# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # Fonts
    ../../extra/fonts.nix
    # System packages
    ../../packages/system.nix

    # Shared configuration
    ../shared

    inputs.nix-data.nixosModules.nix-data
  ];

  networking.firewall.allowedTCPPorts = [22139];

  services.power-profiles-daemon.enable = true;

  programs.nix-data = {
    enable = true;
    systemconfig = "/home/sae/nihh/hosts/rook/configuration.nix";
    flake = "/home/sae/nihh/flake.nix";
    flakearg = "sae";
  };

  # For Tailscale
  services.openssh.enable = true;

  users.users.builder = {
    isNormalUser = true;

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINhQlu6jHF2BLrNvfKy+XXjneqnE3Rz9B2ls6fvw+pWw isakulovdev@gmail.com"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMW/+EvS0eyqdQNWlzO4TxWTy0sVQ2n6pS5YGhB9Vyyt tapnisu@tapnisu-desktop"
    ];
  };

  nix.settings.trusted-users = [
    "root"
    "builder"
  ];

  virtualisation.docker = {
    enable = true;
    rootless.enable = true;
  };

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.gnome.gnome-keyring.enable = true;
  security.pam.services = {
    login.enableGnomeKeyring = true;
    gdm.enableGnomeKeyring = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;

    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true;
        FastConnectable = true;
      };

      Policy = {
        AutoEnable = true;
      };
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sae = {
    isNormalUser = true;
    description = "sae";
    extraGroups = [
      "networkmanager"
      "wheel"
      "input"
      "uinput"
      "docker"
    ];
    shell = pkgs.fish;
    ignoreShellProgramCheck = true;
    packages = [
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
