-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.color_scheme = "Gruvbox Dark (Gogh)"

config.font = wezterm.font("JetBrains Mono")

config.keys = {
	{
		key = "UpArrow",
		mods = "CTRL",
		action = wezterm.action.ScrollByLine(-1),
	},
	{
		key = "DownArrow",
		mods = "CTRL",
		action = wezterm.action.ScrollByLine(1),
	},
}

config.hide_tab_bar_if_only_one_tab = true

-- and finally, return the configuration to wezterm
return config
