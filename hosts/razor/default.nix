{nixpkgs, ...} @ inputs:
nixpkgs.lib.nixosSystem {
  specialArgs = { inputs = inputs; };
  system = "x86_64-linux";
  modules = [
    inputs.disko.nixosModules.disko
    ./configuration.nix
    ./hardware-configuration.nix
  ];
}
