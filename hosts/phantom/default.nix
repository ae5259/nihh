{
  nixpkgs,
  home-manager,
  nur,
  ...
} @ inputs:
nixpkgs.lib.nixosSystem {
  specialArgs = {inherit inputs;} // {hostname = "phantom";};

  modules = [
    ./configuration.nix
    inputs.spicetify-nix.nixosModules.default

    nur.modules.nixos.default
    nur.legacyPackages."x86_64-linux".repos.iopq.modules.xraya

    home-manager.nixosModules.home-manager

    {
      home-manager = {
        sharedModules = [
          nur.modules.homeManager.default
        ];
        useGlobalPkgs = true;

        extraSpecialArgs = {inherit inputs;};
        users.phantom = import ../../home-manager/tuff-home.nix;
      };
    }
  ];
}
