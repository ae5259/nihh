{
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    # Fonts
    ../../extra/fonts.nix
    # System packages
    ../../packages/system.nix
    # Shared configuration
    ../shared
  ];

  boot.supportedFilesystems = ["ntfs" "exfat" "vfat"];

  services.openssh.enable = true;

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.gnome.gnome-keyring.enable = true;
  security.pam.services = {
    login.enableGnomeKeyring = true;
    gdm.enableGnomeKeyring = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  nix = {
    distributedBuilds = true;

    settings = {
      builders-use-substitutes = true;
      max-jobs = 0;
      builders = "@/etc/nix/machines";
    };

    buildMachines = [
      {
        hostName = "100.125.245.105";
        protocol = "ssh-ng";
        sshUser = "builder";
        system = "x86_64-linux";
        maxJobs = 16;
        speedFactor = 10;
        supportedFeatures = ["big-parallel" "kvm"];
      }
    ];
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.phantom = {
    isNormalUser = true;
    description = "phantom";
    extraGroups = [
      "networkmanager"
      "wheel"
      "uinput"
      "input"
    ];
    shell = pkgs.fish;
    packages = [
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
