return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		{ "p00f/nvim-ts-rainbow" },
		{ "nvim-treesitter/nvim-treesitter-context" },
	},
	version = false, -- last release is way too old and doesn't work on Windows
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile", "BufEnter" },
	config = function()
		local status_ok, configs = pcall(require, "nvim-treesitter.configs")
		if not status_ok then
			return
		end

		configs.setup({
			ensure_installed = "all", -- one of "all" or a list of languages
			auto_install = true,
			ignore_install = { "smali" }, -- List of parsers to ignore installing
			incremental_selection = { enable = true },
			highlight = {
				enable = true, -- false will disable the whole extension
				disable = { "css" }, -- list of language that will be disabled
			},
			autopairs = {
				enable = true,
			},
			indent = { enable = true, disable = { "css" } },
			rainbow = {
				enable = true,
				extended_mode = true,
				max_file_lines = nil,
			},
		})
	end,
}
