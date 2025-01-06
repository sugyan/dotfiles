-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

local scheme = wezterm.color.get_builtin_schemes()['Tokyo Night']
scheme.foreground = '#d2d9f8'
scheme.foreground = 'white'
scheme.ansi[8] = 'lightslategray'
config.color_schemes = {
    ['my-scheme'] = scheme,
}
-- config.color_scheme = 'my-scheme'

-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Macchiato'

config.font = wezterm.font_with_fallback({
    'Bitstream Vera Sans Mono',
    'Hiragino Maru Gothic ProN',
})
config.font_size = 13.5
config.window_background_opacity = 0.90

config.audible_bell = "Disabled"
config.initial_rows = 48
config.initial_cols = 180
config.enable_tab_bar = false
wezterm.on('gui-startup', function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():toggle_fullscreen()
end)

config.keys = {
    {
        key = 'y',
        mods = 'CTRL',
        action = wezterm.action.PasteFrom 'Clipboard',
    },
    {
        key = 'f',
        mods = 'CMD',
        action = wezterm.action.SendKey { key = 'f', mods = 'ALT' },
    },
    {
        key = 'b',
        mods = 'CMD',
        action = wezterm.action.SendKey { key = 'b', mods = 'ALT' },
    },
    {
        key = 'd',
        mods = 'CMD',
        action = wezterm.action.SendKey { key = 'd', mods = 'ALT' },
    },
    {
        key = 'w',
        mods = 'CMD',
        action = wezterm.action.SendKey { key = 'w', mods = 'ALT' },
    },
    {
        key = 'v',
        mods = 'CMD',
        action = wezterm.action.SendKey { key = 'v', mods = 'ALT' },
    },
    {
        key = "Enter",
        mods = "CMD",
        action = wezterm.action.ToggleFullScreen,
    },
}

config.check_for_updates = true
config.check_for_updates_interval_seconds = 86400

-- and finally, return the configuration to wezterm
return config
