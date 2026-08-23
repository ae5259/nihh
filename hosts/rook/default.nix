{
  nixpkgs,
  home-manager,
  nur,
  ...
} @ inputs:
nixpkgs.lib.nixosSystem {
  specialArgs = {inherit inputs;} // {hostname = "sae";};
  modules = [
    inputs.spicetify-nix.nixosModules.default
    ./configuration.nix

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

        extraSpecialArgs = {inherit inputs;};
        users.sae = import ../../home-manager/pc-home.nix;
      };
    }
  ];
}
