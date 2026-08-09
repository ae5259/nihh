{
  description = "My nihh configs.";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    # nixpkgs unstable
    nunstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-nv.url = "github:nixos/nixpkgs/ad798619ae7743933943f22d60acbefb073a251a";

    xinux-nixpkgs.url = "git+https://git.oss.uzinfocom.uz/xinux/nixpkgs?ref=nixos-unstable&shallow=1";

    nix-xl.url = "github:PassiveLemon/nix-xl";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-data = {
      url = "github:xinux-org/nix-data";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xinux-modules = {
      url = "git+https://git.oss.uzinfocom.uz/xinux/modules?ref=main&shallow=1";
    };

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        # IMPORTANT: To ensure compatibility with the latest Firefox version, use nixpkgs-unstable.
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    # nix-index-database
    nid = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xinux-settings.url = "git+https://git.oss.uzinfocom.uz/akmal/settings.git";

    uchar.url = "github:uchar-org/cross/uchar/app/latest";
    # https://github.com/uchar-org/cross/blob/uchar/app/latest/flake.nix
    ayugram.url = "github:ndfined-crp/ayugram-desktop";

    xs.url = "git+https://git.oss.uzinfocom.uz/akmal/settings";
    spotiflac.url = "github:Superredstone/spotiflac-cli";
    wall-rs.url = "github:aelloc/wall-rs";
    awzod.url = "github:aelloc/awzod";
    sl.url = "github:aelloc/statline";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    nixosConfigurations.sae = import ./hosts/rook inputs;
    nixosConfigurations.t34 = import ./hosts/pad inputs;
    nixosConfigurations.dell = import ./hosts/dell inputs;
    nixosConfigurations.razor = import ./hosts/razor inputs;

    formatter.${system} = pkgs.alejandra;
    # formatter.${system} = pkgs.nixpkgs-fmt;
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        self.formatter.${system}
        alejandra

        nixd
        statix
        deadnix
        nixfmt-tree
      ];
    };
  };
}
