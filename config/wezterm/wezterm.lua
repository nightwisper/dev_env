local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.font = wezterm.font("MesloLGS Nerd Font", {weight="Regular", stretch="Normal", style="Normal"})
config.font_size = 19
config.enable_wayland = true
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.95

return config
