local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.font = wezterm.font("MesloLGS Nerd Font", {weight="Regular", stretch="Normal", style="Normal"})
config.font_size = 18
config.enable_wayland = true
config.enable_tab_bar = false
config.window_decorations = "NONE"
config.window_background_opacity = 0.85

return config
