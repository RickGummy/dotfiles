local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Transparency
config.window_background_opacity = 1.0
-- config.macos_window_background_blur = 10

config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 14

config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"

config.enable_scroll_bar = true

config.scrollback_lines = 10000

config.keys = {
    -- press enter
    {
        key = 'Enter',
        mods = 'CMD',
        action = wezterm.action.SendString '\x1b[13;9u',
    },
    {
        key = 'Enter',
        mods = 'CMD|SHIFT',
        action = wezterm.action.SendString '\x1b[13;10u',
    },

    -- split panes
    {
        key = 'd',
        mods = 'CMD',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
        key = 'd',
        mods = 'CMD|SHIFT',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },

    -- Move between panes
    {
        key = 'LeftArrow',
        mods = 'CMD',
        action = wezterm.action.ActivatePaneDirection 'Left',
    },
    {
        key = 'RightArrow',
        mods = 'CMD',
        action = wezterm.action.ActivatePaneDirection 'Right',
    },
    {
        key = 'UpArrow',
        mods = 'CMD',
        action = wezterm.action.ActivatePaneDirection 'Up',
    },
    {
        key = 'DownArrow',
        mods = 'CMD',
        action = wezterm.action.ActivatePaneDirection 'Down',
    },

    -- scrolling
    {
        key = 'k',
        mods = 'CMD|SHIFT',
        action = wezterm.action.ScrollByLine(-5),
    },
    {
        key = 'j',
        mods = 'CMD|SHIFT',
        action = wezterm.action.ScrollByLine(5),
    },

    -- tabs
    {
        key = 't',
        mods = 'CMD',
        action = wezterm.action.SpawnTab 'CurrentPaneDomain',
    },
    {
        key = 'w',
        mods = 'CMD',
        action = wezterm.action.CloseCurrentTab { confirm = false },
    },

    -- Close pane
    {
        key = 'w',
        mods = 'CMD|SHIFT',
        action = wezterm.action.CloseCurrentPane { confirm = true },
    },

}


return config
