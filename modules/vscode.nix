{
  config,
  pkgs,
  ...
}: {
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = true;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        rust-lang.rust-analyzer
        denoland.vscode-deno
        ziglang.vscode-zig
        usernamehw.errorlens
        wakatime.vscode-wakatime
        charliermarsh.ruff
        jnoortheen.nix-ide

        mkhl.direnv
        kamadorueda.alejandra
      ];

      userSettings = {
        "chat.agent.enabled" = false;
        "editor.tabSize" = 4;
        "editor.fontSize" = 16;
        "editor.lineHeight" = 1.8;
        "editor.letterSpacing" = 0.6;
        "editor.fontWeight" = "500";
        "window.density.editorTabHeight" = "default";
        "editor.padding.top" = 8;
        "editor.padding.bottom" = 16;
        "editor.overviewRulerBorder" = false;
        "editor.hideCursorInOverviewRuler" = true;
        "editor.fontFamily" = "SF Mono";
        # "editor.fontFamily" = "Iosevka";
        "security.workspace.trust.untrustedFiles" = "open";
        "editor.fontLigatures" = true;
        "editor.smoothScrolling" = true;
        "explorer.confirmDelete" = false;
        "workbench.settings.editor" = "json";
        "window.titleBarStyle" = "custom";
        "python.languageServer" = "Pylance";
        "python.analysis.diagnosticMode" = "workspace";
        "python.analysis.autoSearchPaths" = true;
        "python.analysis.useLibraryCodeForTypes" = true;
        "python.analysis.indexing" = true;
        "python.analysis.logLevel" = "Error";
        "ruff.enable" = true;
        "ruff.lint.enable" = true;
        "[python]" = {
          "editor.defaultFormatter" = "charliermarsh.ruff";
        };
        "editor.formatOnSave" = true;
        "terminal.integrated.fontFamily" = "monospace";
        "workbench.editor.empty.hint" = "hidden";
        "editor.defaultFormatter" = "denoland.vscode-deno";
        "[typescript]" = {
          "editor.defaultFormatter" = "denoland.vscode-deno";
        };
        "[html]" = {
          "editor.defaultFormatter" = "vscode.html-language-features";
        };
        "ruff.nativeServer" = "on";
        "[json]" = {
          "editor.defaultFormatter" = "denoland.vscode-deno";
        };
        "[rust]" = {
          "editor.defaultFormatter" = "rust-lang.rust-analyzer";
        };
        "typescript.inlayHints.parameterNames.enabled" = "all";
        "workbench.sideBar.location" = "right";
        "editor.minimap.enabled" = false;
        "workbench.navigationControl.enabled" = false;
        "workbench.statusBar.visible" = true;
        "workbench.editor.showTabs" = "none";
        "window.menuBarVisibility" = "compact";
        "chat.commandCenter.enabled" = false;
        "workbench.layoutControl.enabled" = false;
        "window.commandCenter" = false;
        "go.toolsManagement.autoUpdate" = true;
        "git.blame.editorDecoration.enabled" = true;
        "zig.zls.enabled" = "on";
      };
    };
  };
}
