-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--  normal_mode = "n",
--  insert_mode = "i",
--  visual_mode = "v",
--  visual_block_mode = "x",
--  term_mode = "t",
--  command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-Left>", "<C-w>h", opts)
keymap("n", "<C-Down>", "<C-w>j", opts)
keymap("n", "<C-Up>", "<C-w>k", opts)
keymap("n", "<C-Right>", "<C-w>l", opts)

-- Resize with arrows
-- keymap("n", "<C-Up>", ":resize -2<CR>", opts)
-- keymap("n", "<C-Down>", ":resize +2<CR>", opts)
-- keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
-- keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-Right>", ":bnext<CR>", opts)
keymap("n", "<S-Left>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Save with CTRL + s
keymap("n", "<C-s>", ":update<CR>", opts)
keymap("v", "<C-s>", "<C-C>:update<CR>", opts)
keymap("i", "<C-s>", "<C-O>:update<CR>", opts)

-- Navigate through wrapped lines
keymap("n", "<leader>w", ":set wrap!<CR>", opts)
keymap("n", "<Down>", "v:count ? 'j' : 'gj'", { expr = true })
keymap("n", "<Up>", "v:count ? 'k' : 'gk'", { expr = true })

-- Copies buffer full path to clipboard
keymap("n", "<C-p>", ":let @+ = expand('%:p')<CR>", opts)
keymap("n", "<C-f>", ":LspZeroFormat<CR>", opts)

-- CTRL + q to quit
keymap("n", "<C-q>", ":q<CR>", opts)

-- Insert --
-- Press nn fast to leave insert mode
keymap("i", "nn", "<ESC>", opts)
keymap("v", "nn", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<S-Down>", ":m .+1<CR>==", opts)
keymap("v", "<S-Up>", ":m .-2<CR>==", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "<S-Down>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<S-Up>", ":move '<-2<CR>gv-gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fs", ":Telescope persisted<CR>", opts)

-- Git
keymap("n", "<leader>g", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>")
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- GitBlame
keymap("n", "<leader>gb", ":GitBlameToggle<CR>", opts)

-- True-Zen keymaps
keymap("n", "<leader>zn", ":TZNarrow<CR>", opts)
keymap("v", "<leader>zn", ":'<,'>TZNarrow<CR>", opts)
keymap("n", "<leader>zf", ":TZFocus<CR>", opts)
keymap("n", "<leader>zm", ":TZMinimalist<CR>", opts)
keymap("n", "<leader>za", ":TZAtaraxis<CR>", opts)

-- Harpoon
keymap("n", "<leader>a", function()
	require("harpoon.mark").add_file()
end, opts)

keymap("n", "<C-e>", function()
	require("harpoon.ui").toggle_quick_menu()
end, opts)

keymap("n", "<leader>tc", function()
	require("harpoon.cmd-ui").toggle_quick_menu()
end, opts)

keymap("n", "<C-1>", function()
	require("harpoon.ui").nav_file(1)
end, opts)

keymap("n", "<C-2>", function()
	require("harpoon.ui").nav_file(2)
end, opts)

keymap("n", "<C-3>", function()
	require("harpoon.ui").nav_file(3)
end, opts)

keymap("n", "<C-4>", function()
	require("harpoon.ui").nav_file(4)
end, opts)

-- DAP
keymap("n", "<F5>", ":lua require'dap'.continue()<CR>", opts)
keymap("n", "<F3>", ":lua require'dap'.step_into()<CR>", opts)
keymap("n", "<F4>", ":lua require'dap'.step_over()<CR>", opts)
keymap("n", "<F12>", ":lua require'dap'.step_out()<CR>", opts)
keymap("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
keymap("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
keymap("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", opts)
keymap("n", "<leader>dt", ":lua require'dap-go'.debug_test()<CR>", opts)
keymap("n", "<leader>do", ":lua require'dapui'.toggle()<CR>", opts)

-- HOP
keymap("n", "<leader>h", ":HopWord<CR>", opts)

-- Paste and Yank
-- keymap("v", "p", '"_dP', opts)
keymap("x", "<leader>p", '"_dP', opts)
keymap("n", "<leader>y", '"+y')
keymap("v", "<leader>y", '"+y')
keymap("n", "<leader>Y", '"+Y')

keymap("n", "<leader>d", '"_d')
keymap("v", "<leader>d", '"_d')
