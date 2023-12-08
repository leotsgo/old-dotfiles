return {
	"nvim-telescope/telescope.nvim",
  cmd = 'Telescope',
  lazy = true,
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			-- NOTE: If you are having trouble with this installation,
			--       refer to the README for telescope-fzf-native for more instructions.
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
	},
	config = function()
		local status_ok, telescope = pcall(require, "telescope")
		if not status_ok then
			return
		end

		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				prompt_prefix = " ",
				selection_caret = " ",
				path_display = { "smart" },
				file_ignore_patterns = { ".git/", "node_modules" },
				extensions = {
					persisted = {
						layout_config = { width = 0.55, height = 0.55 },
					},
				},

				mappings = {
					i = {
						["<Down>"] = actions.cycle_history_next,
						["<Up>"] = actions.cycle_history_prev,
						["<C-Down>"] = actions.move_selection_next,
						["<C-Up>"] = actions.move_selection_previous,
					},
				},
			},
		})

		telescope.load_extension("persisted")
		telescope.load_extension("fzf")
	end,
}
