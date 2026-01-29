{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    nix-xl.url = "github:PassiveLemon/nix-xl";

    awzod.url = "github:ae5259/awzod";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wall-rs.url = "github:ae5259/wall-rs";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixos-hardware,
      nur,
      ...
    }@inputs:
    {
      nixosConfigurations.t34 = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./nixos/configuration.nix

          nixos-hardware.nixosModules.lenovo-thinkpad-t14-intel-gen6

          nur.modules.nixos.default
          nur.legacyPackages."x86_64-linux".repos.iopq.modules.xraya

          home-manager.nixosModules.home-manager

          {
            home-manager = {
              sharedModules = [
                nur.modules.homeManager.default
              ];
              useGlobalPkgs = true;
              # useUserPackages = true;
              # backupFileExtension = "backup";

              extraSpecialArgs = { inherit inputs; };
              users.t34 = import ./home-manager/home.nix;
            };
          }
        ];
      };
    }
    // (
      let
        system = "x86_64-linux";
        pkgs = import nixpkgs { inherit system; };
      in
      {
        formatter.${system} = pkgs.nixfmt;
        devShells.${system}.default = pkgs.mkShell {
          packages = with pkgs; [
            self.formatter.${system}
            nixd
            statix
            deadnix
            nixfmt-tree
          ];
        };
      }
    );
}
