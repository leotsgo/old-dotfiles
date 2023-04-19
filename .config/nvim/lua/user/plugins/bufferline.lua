return {
	"akinsho/bufferline.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	-- after = "catppuccin",
	config = function()
		local status_ok, bufferline = pcall(require, "bufferline")
		if not status_ok then
			return
		end

		bufferline.setup({
			options = {
				close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
				right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
				offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
				separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
			},
		})

		vim.g.transparent_groups = vim.list_extend(
			vim.g.transparent_groups or {},
			vim.tbl_map(function(v)
				return v.hl_group
			end, vim.tbl_values(require("bufferline.config").highlights))
		)
	end,
}
