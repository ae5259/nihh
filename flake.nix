{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-25.11 branch here
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";

      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    appleFontsOverlay = _: prev: {
      sf-pro = prev.stdenv.mkDerivation {
        name = "SFMono";
        version = "0.3.0";

        src = ./fonts/SFMono/SFMonoRegular.otf;

        # installPhase = ''
        #   mkdir -p $out/share/fonts/truetype/
        #   cp $src/*.ttf $out/share/fonts/truetype/
        # '';
        meta = {
          description = "SFMono";
        };

        installPhase = ''
          mkdir -p $out/share/fonts
          mkdir -p $out/share/fonts/opentype
          mkdir -p $out/share/fonts/truetype
          find -name \*.otf -exec mv {} $out/share/fonts/opentype/ \;
          find -name \*.ttf -exec mv {} $out/share/fonts/truetype/ \;
        '';
      };
    };
  in {
    nixosConfigurations.t34 = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./nixos/configuration.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";

          home-manager.users.t34 = import ./home-manager/home.nix;
        }
      ];
    };
  };
}
