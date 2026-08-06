{...}: {
  programs.wezterm = {
    enable = true;

    extraConfig = "
      local wezterm = require 'wezterm'
      local act = wezterm.action

      return {
        font = wezterm.font 'Maple Mono Normal NL NF Medium',
        color_scheme = 'gruvbox_material_dark_hard',
        color_schemes = {
          ['gruvbox_material_dark_hard'] = {
              foreground = '#D4BE98',
              background = '#121212',
              cursor_bg = '#D4BE98',
              cursor_border = '#D4BE98',
              cursor_fg = '#1D2021',
              selection_bg = '#D4BE98' ,
              selection_fg = '#3C3836',

              ansi = {\"#1d2021\",\"#ea6962\",\"#a9b665\",\"#d8a657\", \"#7daea3\",\"#d3869b\", \"#89b482\",\"#d4be98\"},
              brights = {\"#eddeb5\",\"#ea6962\",\"#a9b665\",\"#d8a657\", \"#7daea3\",\"#d3869b\", \"#89b482\",\"#d4be98\"},
            },
          },

        keys = {
          {
            key = 'l',
            mods = 'SUPER',
            action = act.SplitPane {
              direction = 'Right',
              size = { Percent = 50 },
            },
          },
          {
            key = 'j',
            mods = 'SUPER',
            action = act.SplitPane {
              direction = 'Down',
              size = { Percent = 50 },
            },
          },
          {
            key = 'k',
            mods = 'SUPER',
            action = act.SplitPane {
              direction = 'Up',
              size = { Percent = 50 },
            },
          },
          {
            key = 'h',
            mods = 'SUPER',
            action = act.SplitPane {
              direction = 'Left',
              size = { Percent = 50 },
            },
          },
          {
            key = 't',
            mods = 'ALT',
            action = act.SpawnTab 'CurrentPaneDomain',
          },

          {
            key = 'w',
            mods = 'ALT',
            action = wezterm.action.CloseCurrentPane { confirm = true },
          },
          
          { key = 'h', mods = 'ALT', action = act.ActivatePaneDirection 'Left' },
          { key = 'l', mods = 'ALT', action = act.ActivatePaneDirection 'Right' },
          { key = 'k', mods = 'ALT', action = act.ActivatePaneDirection 'Up' },
          { key = 'j', mods = 'ALT', action = act.ActivatePaneDirection 'Down' },

          {
            key = 'p',
            mods = 'ALT',
            action = wezterm.action.ActivateCommandPalette,
          },
          
          {
            key = 'i',
            mods = 'ALT',
            action = wezterm.action.ActivateCopyMode,
          },

          {
            key = 's',
            mods = 'ALT',
            action = wezterm.action.PaneSelect,
          },

          { key = 'j', mods = 'ALT|SHIFT', action = act.ActivateTabRelative(-1) },
          { key = 'k', mods = 'ALT|SHIFT', action = act.ActivateTabRelative(1) },

          { key = 'Backspace', mods = 'CTRL', action = act.SendKey { key = 'w', mods = 'CTRL' } },
        },
      }
      ";
  };
}
