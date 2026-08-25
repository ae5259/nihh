{...}: [
  {
    context = "Editor";
    bindings = {
      shift-k = "editor::Hover";
      "space o" = "tab_switcher::Toggle";
      "space e" = "workspace::ToggleRightDock";
      "space p" = "outline::Toggle";
      "space v" = "editor::GoToDefinitionSplit";
      "space c" = "pane::CloseActiveItem";
      "space w" = "workspace::Save";
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
