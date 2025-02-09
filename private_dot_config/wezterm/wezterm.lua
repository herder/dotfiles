-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- config.debug_key_events = false

-- This is where you actually apply your config choices
config.font = wezterm.font("JetbrainsMonoNL NF")
config.font_size = 11.0

config.harfbuzz_features = {
	"ss01",
	"ss02",
	"ss03",
	"ss04",
	"ss05",
	"ss06",
	"ss07",
	"calt",
	"ss08",
	"dlig",
	"calt",
}

config.keys = {
	{
		action = wezterm.action.SendKey({ key = "w", mods = "CTRL" }),
		mods = "CTRL",
		key = "Backspace",
	},
}
-- Disable all default key bindings - interferes with tmux/vi-zsh-mode/vim
-- https://github.com/wez/wezterm/discussions/2891#discussioncomment-4491770
config.disable_default_key_bindings = true
-- For example, changing the color scheme:
-- See here for all of em: https://wezfurlong.org/wezterm/colorschemes/
config.color_scheme = "Kanagawa (Gogh)"
config.window_background_opacity = 0.9
config.window_decorations = "NONE"
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = true
config.enable_tab_bar = false
config.line_height = 1.0
-- and finally, return the configuration to wezterm
return config
