{pkgs, ...}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -U fish_greeting
      set -g fish_key_bindings fish_vi_key_bindings
    '';

    generateCompletions = false;

    shellAliases = {
      zj = "zellij";
      ls = "exa --icons=always";
      mf = "microfetch";
      ee = "ls --tree";
      lg = "lazygit";
      ezit = "exit";
      ez = "exit";
      ex = "exit";

      die = "shutdown now";
      re = "reboot";
      sleep = "systemctl hibernate";

      reload = "sudo nixos-rebuild switch --flake ~/nihh#$(whoami) && $SHELL";

      # NixOS related
      past = "nix profile history --profile /nix/var/nix/profiles/system";
      garbage = "sudo nix-collect-garbage --delete-old";

      # Neovim
      nv = "NVIM_APPNAME=astronvim nvim";
      mnv = "NVIM_APPNAME=neovim nvim";
    };

    plugins = [
      {
        name = "grc";
        src = pkgs.fishPlugins.grc.src;
      }
      {
        name = "z";
        src = pkgs.fetchFromGitHub {
          owner = "jethrokuan";
          repo = "z";
          rev = "e0e1b9dfdba362f8ab1ae8c1afc7ccf62b89f7eb";
          sha256 = "0dbnir6jbwjpjalz14snzd3cgdysgcs3raznsijd6savad3qhijc";
        };
      }
    ];
  };
}
