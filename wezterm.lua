local wezterm = require("wezterm")
local act = wezterm.action
local config = {}
config.font = wezterm.font({
	family = "JetBrains Mono",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
})
config.keys = {
	{
		key = "h",
		mods = "CTRL|ALT",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "CTRL|ALT",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "CTRL|ALT",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "CTRL|ALT",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "\\",
		mods = "CTRL|ALT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "CTRL|ALT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{ key = "k", mods = "ALT", action = act.ScrollByLine(-1) },
	{ key = "j", mods = "ALT", action = act.ScrollByLine(1) },
	{ key = "n", mods = "CTRL|ALT", action = act.SpawnTab("DefaultDomain") },
	{ key = "Enter", mods = "ALT", action = act.ToggleFullScreen },
	{ key = "=", mods = "CTRL", action = act.IncreaseFontSize },
	{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
	{ key = "0", mods = "CTRL", action = act.ResetFontSize },
	{ key = "C", mods = "SHIFT|CTRL", action = act.CopyTo("Clipboard") },
	{ key = "V", mods = "SHIFT|CTRL", action = act.PasteFrom("Clipboard") },
	{ key = "F", mods = "SHIFT|CTRL", action = act.Search("CurrentSelectionOrEmptyString") },
	{ key = "N", mods = "SHIFT|CTRL", action = act.SpawnWindow },
	{ key = "R", mods = "ALT|CTRL", action = act.ReloadConfiguration },
	{ key = "W", mods = "ALT|CTRL", action = act.CloseCurrentTab({ confirm = true }) },
	{ key = "X", mods = "ALT|CTRL", action = act.ActivateCopyMode },
	{ key = "j", mods = "ALT", action = act.ScrollByLine(1) },
	{ key = "k", mods = "ALT", action = act.ScrollByLine(-1) },
	{ key = "n", mods = "ALT|CTRL", action = act.SpawnTab("DefaultDomain") },
	{ key = "PageUp", mods = "ALT", action = act.ScrollByPage(-1) },
	{ key = "PageDown", mods = "ALT", action = act.ScrollByPage(1) },

	{
		key = "H",
		mods = "ALT|CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "J",
		mods = "ALT|CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{ key = "K", mods = "ALT|CTRL|SHIFT", action = act.AdjustPaneSize({ "Up", 5 }) },
	{
		key = "L",
		mods = "ALT|CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
}
for i = 1, 8 do
	-- CTRL+ALT + number to activate that tab
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CTRL|ALT",
		action = act.ActivateTab(i - 1),
	})
end

return config
