return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" }, -- Required
		{ "williamboman/mason.nvim" }, -- Optional
		{ "williamboman/mason-lspconfig.nvim" }, -- Optional

		-- Autocompletion
		-- { "hrsh7th/nvim-cmp" }, -- Required
		{ "yioneko/nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lsp" }, -- Required
		{ "hrsh7th/cmp-buffer" }, -- Optional
		{ "hrsh7th/cmp-path" }, -- Optional
		{ "saadparwaiz1/cmp_luasnip" }, -- Optional
		{ "hrsh7th/cmp-nvim-lua" }, -- Optional

		-- Snippets
		{ "L3MON4D3/LuaSnip" }, -- Required
		{ "rafamadriz/friendly-snippets" }, -- Optional
	},
	config = function()
		local lsp = require("lsp-zero")
		local cmp = require("cmp")
		lsp.preset("recommended")
		require("mason").setup({ ui = { border = "rounded" } })
		lsp.nvim_workspace()
		lsp.setup()
		lsp.setup_nvim_cmp({
			preselect = "none",
			completion = {
				completeopt = "menu,menuone,noinsert,noselect",
			},
		})

		lsp.set_sign_icons({
			error = "✘",
			warn = "▲",
			hint = "⚑",
			info = "»",
		})

		lsp.format_mapping("<C-f>", {
			format_opts = {
				async = false,
				timeout_ms = 10000,
			},
		})

		cmp.setup({
			mapping = {
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			},
		})
		require("lspconfig.ui.windows").default_options.border = "rounded"
	end,
}
