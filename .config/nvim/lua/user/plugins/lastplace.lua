return {
	"ethanholz/nvim-lastplace",
	event = "VeryLazy",
	config = function()
		require("nvim-lastplace").setup({
			lastplace_open_folds = true,
		})
	end,
}
