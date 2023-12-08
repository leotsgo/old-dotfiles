return {
	"creativenull/efmls-configs-nvim",
	version = "v1.x.x",
	dependencies = { "neovim/nvim-lspconfig" },
	config = function()
		local languages = require("efmls-configs.defaults").languages()

		languages = vim.tbl_extend("force", languages, {
			-- Custom languages, or override existing ones
			go = {
				{
					formatCommand = "golines --base-formatter gofumpt",
					formatStdin = true,
				},
			},
		})
		local efmls_config = {
			filetypes = vim.tbl_keys(languages),
			settings = {
				rootMarkers = { ".git/" },
				languages = languages,
			},
			init_options = {
				documentFormatting = true,
				documentRangeFormatting = true,
			},
		}

		require("lspconfig").efm.setup(vim.tbl_extend("force", efmls_config, {}))
	end,
}
