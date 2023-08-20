return {
	"m4xshen/hardtime.nvim",
	dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
	opts = {
		restricted_keys = {
			["<Up>"] = { "n", "x" },
			["<Down>"] = { "n", "x" },
			["<Left>"] = { "n", "x" },
			["<Right>"] = { "n", "x" },
		},
		disabled_keys = {
			["<Up>"] = {},
			["<Down>"] = {},
			["<Left>"] = {},
			["<Right>"] = {},
		},
	},
}
