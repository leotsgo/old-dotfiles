return {
	"monaqa/dial.nvim",
	config = function()
		vim.keymap.set("n", "<C-u>", require("dial.map").inc_normal(), { noremap = true })
		vim.keymap.set("n", "<C-l>", require("dial.map").dec_normal(), { noremap = true })
	end,
}
