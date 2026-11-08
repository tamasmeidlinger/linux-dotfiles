local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.window_decorations = "RESIZE"

config.enable_tab_bar = false

config.audible_bell = "Disabled"

config.color_scheme = "Catppuccin Frappe"

return config
