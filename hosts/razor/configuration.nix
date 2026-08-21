{
  modulesPath,
  pkgs,
  ...
} @ args: {
  imports = [
    ./ngi.nix
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    ./disk-config.nix
  ];
  boot.loader.grub = {
    efiSupport = true;
    efiInstallAsRemovable = true;
  };

  networking = {
    useDHCP = false;

    interfaces.eth0.ipv4.addresses = [
      {
        address = "169.58.142.217";
        prefixLength = 17;
      }
    ];

    defaultGateway = {
      address = "169.58.128.1";
      interface = "eth0";
    };

    nameservers = [
      "195.179.224.53"
      "209.126.15.53"
    ];

    firewall.allowedTCPPorts = [22 443 80];
  };

  nix = {
    settings = {
      trusted-public-keys = [
        "cache.xinux.uz:BXCrtqejFjWzWEB9YuGB7X2MV4ttBur1N8BkwQRdH+0="
        "ayugram-desktop.cachix.org:AZ5EqHrJsAKL5YkZYLPEsb1FdD9QlypUwQ0REcJftgA="
      ];

      trusted-users = [
        "root"
        "sae"
        "razor"
      ];

      experimental-features = "nix-command flakes pipe-operators";
    };
  };

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "prohibit-password";
    };
  };

  users.users.nginx.extraGroups = ["acme"];

  users.users.razor = {
    isNormalUser = true;
    description = "razoooooor!!!";
    extraGroups = ["wheel" "docker"];
    shell = pkgs.fish;

    home = "/home/razor";

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINhQlu6jHF2BLrNvfKy+XXjneqnE3Rz9B2ls6fvw+pWw isakulovdev@gmail.com"
    ];
  };

  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    curl
    gitMinimal
    vim
    alejandra
    zsh
    lazygit
  ];

  virtualisation.docker = {
    enable = true;
    rootless.enable = true;
  };

  users.users.root.openssh.authorizedKeys.keys =
    [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINhQlu6jHF2BLrNvfKy+XXjneqnE3Rz9B2ls6fvw+pWw isakulovdev@gmail.com"
    ]
    ++ (args.extraPublicKeys or []);

  system.stateVersion = "26.05";
}
