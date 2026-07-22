{
  config,
  ...
}: {
  programs.git = {
    enable = true;
    lfs.enable = true;

    ignores = [
      ".idea"
      "node_modules"
      # where did this come from? I don't own Apple Device 🗿
      ".DS_Store"
      "*.swp"
    ];

    signing = {
      signByDefault = true;
      key = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
      format = "ssh";
    };

    settings = {
      user = {
        name = "akmal";
        email = "isakulovdev@gmail.com";
      };

      credential.helper = "store";
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
