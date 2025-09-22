-- wezterm.lua
local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'Catppuccin Frappe'
config.window_background_opacity = 0.95
config.font = wezterm.font_with_fallback {
  'JetBrainsMono NF',
  'Noto Color Emoji',
}
config.hide_tab_bar_if_only_one_tab = true
config.line_height = 1.1

-- Set the default program to PowerShell 7+
config.default_prog = { 'pwsh.exe', '-NoLogo' }

config.keys = {
  -- Send a literal CTRL-a when you press CTRL-a, a
  {
    key = 'a',
    mods = 'LEADER',
    action = wezterm.action.SendKey { key = 'a', mods = 'CTRL' },
  },

  -- =========================================================================
  -- TABS
  -- Keys are chosen to be mnemonic (c for create, n/p for next/prev)
  -- =========================================================================
  -- Create a new tab (Leader, c)
  {
    key = 'c',
    mods = 'LEADER',
    action = wezterm.action.SpawnTab 'DefaultDomain',
  },
  -- Close the current tab (Leader, x)
  {
    key = 'x',
    mods = 'LEADER',
    action = wezterm.action.CloseCurrentTab { confirm = true },
  },
  -- Navigate tabs (Leader, n for next, p for previous)
  { key = 'n', mods = 'LEADER', action = wezterm.action.ActivateTabRelative(1) },
  { key = 'p', mods = 'LEADER', action = wezterm.action.ActivateTabRelative(-1) },
  -- Go to specific tabs (Leader, 1-9)
  { key = '1', mods = 'LEADER', action = wezterm.action.ActivateTab(0) },
  { key = '2', mods = 'LEADER', action = wezterm.action.ActivateTab(1) },
  { key = '3', mods = 'LEADER', action = wezterm.action.ActivateTab(2) },
  { key = '4', mods = 'LEADER', action = wezterm.action.ActivateTab(3) },
  { key = '5', mods = 'LEADER', action = wezterm.action.ActivateTab(4) },
  { key = '6', mods = 'LEADER', action = wezterm.action.ActivateTab(5) },
  { key = '7', mods = 'LEADER', action = wezterm.action.ActivateTab(6) },
  { key = '8', mods = 'LEADER', action = wezterm.action.ActivateTab(7) },
  { key = '9', mods = 'LEADER', action = wezterm.action.ActivateTab(-1) }, -- Last tab


  -- =========================================================================
  -- PANES (Splits)
  -- We use tmux-like keys: " for horizontal, % for vertical
  -- =========================================================================
  -- Split pane horizontally (Leader, |)
  {
    key = '|',
    mods = 'LEADER',
    action = wezterm.action.SplitPane {
      direction = 'Right',
      size = { Percent = 50 },
    },
  },
  -- Split pane vertically (Leader, -)
  {
    key = '-',
    mods = 'LEADER',
    action = wezterm.action.SplitPane {
      direction = 'Down',
      size = { Percent = 50 },
    },
  },
  -- Close the current pane (Leader, x - same as closing a tab, context-aware)
  -- Note: We already mapped 'x' to CloseCurrentTab. Wezterm is smart; if you
  -- have a pane focused, you'll be prompted to close the pane. If you only
  -- have one pane in a tab, it will prompt to close the tab.
  -- To make it explicitly close ONLY the pane:
  -- { key = 'x', mods = 'LEADER', action = wezterm.action.CloseCurrentPane { confirm = true } },


  -- Navigate between panes using Leader + Arrow Keys or vim keys
  { key = 'h', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Left' },
  { key = 'l', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Right' },
  { key = 'k', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Up' },
  { key = 'j', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Down' },

  -- Resize panes using Leader + SHIFT + Arrow Keys
  { key = 'h',  mods = 'LEADER|SHIFT', action = wezterm.action.AdjustPaneSize { 'Left', 1 } },
  { key = 'l', mods = 'LEADER|SHIFT', action = wezterm.action.AdjustPaneSize { 'Right', 1 } },
  { key = 'k',    mods = 'LEADER|SHIFT', action = wezterm.action.AdjustPaneSize { 'Up', 1 } },
  { key = 'j',  mods = 'LEADER|SHIFT', action = wezterm.action.AdjustPaneSize { 'Down', 1 } },


  -- =========================================================================
  -- UTILITY (These are not behind the leader key)
  -- =========================================================================
  -- Copy and Paste (Standard terminal shortcuts)
  { key = 'c', mods = 'CTRL|SHIFT', action = wezterm.action.CopyTo 'Clipboard' },
  { key = 'v', mods = 'CTRL|SHIFT', action = wezterm.action.PasteFrom 'Clipboard' },

  -- Toggle Fullscreen
  {
    key = 'Enter',
    mods = 'ALT',
    action = wezterm.action.ToggleFullScreen,
  },

  -- =========================================================================
  -- UTILITY (These ARE behind the leader key)
  -- =========================================================================
  -- Font size
  { key = '=', mods = 'LEADER', action = wezterm.action.IncreaseFontSize },
  { key = '-', mods = 'LEADER', action = wezterm.action.DecreaseFontSize },
  { key = '0', mods = 'LEADER', action = wezterm.action.ResetFontSize },

  -- Search scrollback (Leader, /)
  {
    key = '/',
    mods = 'LEADER',
    action = wezterm.action.Search { CaseSensitiveString = '' },
  },

  -- Activate the command palette / launcher (Leader, Space)
  {
    key = ' ', -- Space bar
    mods = 'LEADER',
    action = wezterm.action.ShowLauncher,
  },
}

return config