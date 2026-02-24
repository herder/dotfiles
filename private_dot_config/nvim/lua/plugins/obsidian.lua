return {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"saghen/blink.cmp",
	},
	ft = "markdown",
	opts = {
		workspaces = {
			{
				name = "vault",
				path = "~/Documents/Private Sync",
			},
		},
		daily_notes = {
			folder = "Notes/Daily",
			date_format = "%Y-%m-%d",
		},
		completion = {
			nvim_cmp = false,
			blink = true,
			min_chars = 2,
		},
		legacy_commands = false,
		new_notes_location = "current_dir",
		wiki_link_func = "use_alias_only",
		note_id_func = function(title)
			if title ~= nil then
				return title
			end
			return tostring(os.time())
		end,
	},
}
