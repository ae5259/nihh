{
  pkgs,
  inputs,
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

    ../../niri

    inputs.nix-data.nixosModules.nix-data
  ];

  boot.supportedFilesystems = [
    "ntfs"
    "exfat"
    "vfat"
  ];

  services.openssh.enable = true;

  services.fprintd = {
    enable = true;
    package = pkgs.fprintd-tod;
    tod.enable = true;
    tod.driver = pkgs.libfprint-2-tod1-broadcom;
  };

  services.pcscd.enable = true;
  environment.systemPackages = with pkgs; [
    ccid
    opensc
  ];

  services.thermald.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dell = {
    isNormalUser = true;
    description = "dell";
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

  programs.niri = {
    enable = true;
  };

  nix = {
    distributedBuilds = true;

    settings = {
      builders-use-substitutes = true;
      max-jobs = 0;
      builders = "@/etc/nix/machines";
    };

    buildMachines = [
      {
        hostName = "sae"; 
        protocol = "ssh-ng";
        sshUser = "builder";
        system = "x86_64-linux";
        maxJobs = 16;
        speedFactor = 10;
        supportedFeatures = [ "big-parallel" "kvm" ];
      }
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?
}
