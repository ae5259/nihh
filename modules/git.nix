{ config, pkgs, ...}:
{
  programs.git = {
      enable = true;
      lfs.enable = true;

      ignores = [
        ".idea"
        "node_modules"
        ".DS_Store"
        "*.swp"
      ];

      settings = {
        user = {
          name = "akmal";
          email = "isakulovdev@gmail.com";
        };
        init.defaultBranch = "main";
        core = {
          editor = "nvim";
          autocrlf = "input";
        };
        commit.gpgsign = true;
        pull.rebase = true;
        rebase.autoStash = true;
        push.autoSetupRemote = true;
      };
    };
}