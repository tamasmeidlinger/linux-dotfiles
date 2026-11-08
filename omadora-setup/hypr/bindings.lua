-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

-- Personal changes

hl.unbind("SUPER + W")
hl.unbind("SUPER + J")

-- Switching workspaces
o.bind("CTRL + SHIFT + K", "Next workspace", hl.dsp.focus({ workspace = "e+1" }))
o.bind("CTRL + SHIFT + J", "Previous workspace", hl.dsp.focus({ workspace = "e-1" }))

-- Move window focus
o.rebind("F9", "Move focus left", hl.dsp.focus({ direction = "left" }))
o.rebind("F10", "Move focus left", hl.dsp.focus({ direction = "down" }))
o.rebind("F11", "Move focus left", hl.dsp.focus({ direction = "up" }))
o.rebind("F12", "Move focus left", hl.dsp.focus({ direction = "right" }))

o.rebind("SHIFT + F9", "Move window left", hl.dsp.window.move({ direction = "left" }))
o.rebind("SHIFT + F10", "Move window down", hl.dsp.window.move({ direction = "down" }))
o.rebind("SHIFT + F11", "Move window up", hl.dsp.window.move({ direction = "up" }))
o.rebind("SHIFT + F12", "Move window right", hl.dsp.window.move({ direction = "right" }))

-- Move window to workspace
o.rebind("CTRL + SHIFT + 1", "Move to workspace 1", hl.dsp.window.move({ workspace = 1 }))
o.rebind("CTRL + SHIFT + 2", "Move to workspace 2", hl.dsp.window.move({ workspace = 2 }))
o.rebind("CTRL + SHIFT + 3", "Move to workspace 3", hl.dsp.window.move({ workspace = 3 }))
o.rebind("CTRL + SHIFT + 4", "Move to workspace 4", hl.dsp.window.move({ workspace = 4 }))
o.rebind("CTRL + SHIFT + 5", "Move to workspace 5", hl.dsp.window.move({ workspace = 5 }))

-- Launching apps
-- o.bind("CTRL + SPACE", "Rofi", "rofi -show drun")
o.bind("CTRL + RETURN", "Launch Terminal CTRL", "foot")
o.rebind("F5", "Take a Screenshot", "omarchy screenshot")
