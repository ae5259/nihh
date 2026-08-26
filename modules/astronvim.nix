{
  pkgs,
  ...
}: {
  xdg.configFile.astronvim = {
    source = ../astronvim;
    recursive = true;
  };

  programs.neovim = {
    enable = true;

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
