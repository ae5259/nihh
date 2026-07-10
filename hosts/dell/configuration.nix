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

    inputs.nix-data.nixosModules.nix-data
  ];


  boot.supportedFilesystems = ["ntfs" "exfat" "vfat"];

  services.fprintd.enable = true;
  services.fprintd.tod.enable = true;
  services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix-550a;

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
    enable = false;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?
}
