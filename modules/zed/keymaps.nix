{...}: [
  {
    context = "VimControl && !menu";
    bindings = {
      cmd-j = "editor::MoveLineDown";
      cmd-k = "editor::MoveLineUp";
      shift-k = "editor::Hover";
      "space o" = "tab_switcher::Toggle";
      "space e" = "workspace::ToggleRightDock";
      "space p" = "outline::Toggle";
      "space v" = "editor::GoToDefinitionSplit";
      "space b" = "editor::GoToDefinition";
      "space s" = "pane::DeploySearch";
      "g r" = "editor::FindAllReferences";
      shift-n = "editor::ToggleFold";
      "space f" = "file_finder::Toggle";
      ctrl-l = "pane::ActivateNextItem";
      ctrl-h = "pane::ActivatePreviousItem";
    };
  }
  {
    context = "Editor && vim_mode == visual && !VimWaiting && !VimObject";
    bindings = {
      p = [
        "vim::Paste"
        {
          preserve_clipboard = true;
        }
      ];
    };
  }
]
