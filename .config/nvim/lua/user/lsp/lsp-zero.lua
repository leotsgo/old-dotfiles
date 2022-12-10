local lsp = require("lsp-zero")
local keymap = vim.keymap.set
local key_opts = {}
lsp.preset("recommended")
local rust_lsp = lsp.build_options("rust_analyzer", {})
lsp.nvim_workspace()
lsp.setup()

-- Initialize rust_analyzer with rust-tools
require("rust-tools").setup({ server = rust_lsp })
