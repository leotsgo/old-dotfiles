local gbox_status_ok, gruvbox = pcall(require, "gruvbox")
if not gbox_status_ok then
	return
end

gruvbox.setup({
	undercurl = true,
	underline = true,
	bold = true,
	italic = true,
	strikethrough = true,
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	invert_intend_guides = false,
	inverse = false, -- invert background for search, diffs, statuslines and errors
	contrast = "hard", -- can be "hard", "soft" or empty string
	overrides = {},
})

local colorscheme = "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
