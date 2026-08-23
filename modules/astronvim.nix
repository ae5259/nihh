{
  inputs,
  pkgs,
  ...
}: {
  xdg.configFile.astronvim = {
    source = ../astronvim;
    recursive = true;
  };

  xdg.configFile.kickstart = {
    source = ../kickstart;
    recursive = true;
  };

  programs.neovim = {
    enable = true;
    # package = inputs.nixpkgs-nv.legacyPackages.${pkgs.stdenv.hostPlatform.system}.neovim-unwrapped;

    extraConfig = "";

    extraPackages = with pkgs; [
      nodejs
      selene
      nixd
      deadnix
      statix
      gdu
      lazygit
      python3
      pyright

      lua-language-server
      lua5_1
      luarocks
      stylua

      tectonic
      tree-sitter
    ];
  };
}
