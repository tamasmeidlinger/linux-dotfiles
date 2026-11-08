local wezterm = require 'wezterm'
local config = {}
config.color_scheme = "Noctalia"
config.keys = {
	{
		key = "Insert",
		mods = "SHIFT",
		action = wezterm.action.PasteFrom 'Clipboard',
	}
}

config.enable_tab_bar = false
config.cursor_thickness = 1
return config
