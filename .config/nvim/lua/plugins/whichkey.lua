return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 200
	end,
	config = function()
		local wk = require("which-key")
		local keymap = vim.keymap.set
		wk.setup({
			window = {
				windowblend = 100,
			},
		})
		-- Paste and Yank
		-- keymap("v", "p", '"_dP', opts)
		keymap("x", "<leader>p", '"_dP', { desc = "Paste from clipboard" })
		keymap("n", "<leader>y", '"+y', { desc = "Yank to clipboard" })
		keymap("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })
		keymap("n", "<leader>Y", '"+Y', { desc = "Yank to clipboard" })

		keymap("n", "<leader>d", '"_d', { desc = "Delete without yank" })
		keymap("v", "<leader>d", '"_d', { desc = "Delete without yank" })

		keymap("n", "<F5>", ":lua require'dap'.continue()<CR>")
		keymap("n", "<F3>", ":lua require'dap'.step_into()<CR>")
		keymap("n", "<F4>", ":lua require'dap'.step_over()<CR>")
		keymap("n", "<F12>", ":lua require'dap'.step_out()<CR>")
		keymap("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
		keymap("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
		keymap("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
		keymap("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")
		keymap("n", "<leader>dt", ":lua require'dap-go'.debug_test()<CR>")
		keymap("n", "<leader>do", ":lua require'dapui'.toggle()<CR>")

		keymap("i", "qq", "<ESC>")

		wk.register({
			["<leader>"] = {
				f = {
					name = "Find",
					f = { "<cmd>Telescope find_files<cr>", "[F]ind [F]iles" },
					t = { "<cmd>Telescope live_grep<cr>", "[F]ind [T]ext" },
					p = { "<cmd>Telescope projects<cr>", "[F]ind [P]rojects" },
					b = { "<cmd>Telescope buffers<cr>", "[F]ind [B]uffers" },
					s = { "<cmd>Telescope persisted<cr>", "[F]ind [S]aved" },
					["?"] = { "<cmd>Telescope oldfiles<cr>", "[?] Find recently opened files" },
					g = { "<cmd>Telescope git_files<cr>", "Search [G]it [F]iles" },
					h = { "<cmd>Telescope help_tags<cr>", "[S]earch [H]elp" },
					w = { "<cmd>Telescope grep_string<cr>", "[S]earch current [W]ord" },
					d = { "<cmd>Telescope diagnostics<cr>", "[S]earch [D]iagnostics" },
					r = { "<cmd>Telescope lsp_references<cr>", "[G]oto [R]eferences" },
				},
				r = { name = "Rename" },
				b = {
					name = "Buffer",
					["<Right>"] = { "<cmd>BufferLineCycleNext<cr>", "Next buffer" },
					["<Left>"] = { "<cmd>BufferLineCyclePrev<cr>", "Previous buffer" },
					q = { "<cmd>bd<cr>", "Close buffer" },
				},
				e = { "<cmd>Neotree toggle<cr>", "Toggle [E]xplorer" },
				c = { "<cmd>nohlsearch<cr>", "[C]lear [H]ighlight" },
				G = {
					name = "Git",
					b = { "<cmd>GitBlameToggle<cr>", "Blame" },
					g = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "LazyGit" },
				},
			},
			g = {
				name = "Go To",
			},
			["-"] = { "<cmd>Oil<CR>", "Open parent directory" },
		})
	end,
}
