{
  nixpkgs,
  home-manager,
  nixos-hardware,
  nur,
  nid,
  ...
} @ inputs:
nixpkgs.lib.nixosSystem {
  specialArgs = {inherit inputs;} // {hostname = "t34";};

  modules = [
    inputs.spicetify-nix.nixosModules.default
    ./configuration.nix
    nid.nixosModules.default

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

        extraSpecialArgs = {inherit inputs;};
        users.t34 = import ../../home-manager/pad-home.nix;
      };
    }
  ];
}
