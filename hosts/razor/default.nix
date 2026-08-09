{
  nixpkgs,
  disko,
}:
nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";
  modules = [
    disko.nixosModules.disko
    ./configuration.nix
    ./hardware-configuration.nix
  ];
}
