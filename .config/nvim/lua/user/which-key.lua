local ok, wk = pcall(require, "which-key")
if not ok then
	return
end

wk.setup()

-- Telescope
wk.register({
	f = {
		name = "Files",
	},
}, { prefix = "<leader>" })

-- True-Zen
wk.register({
	z = {
		name = "TrueZen",
	},
}, { prefix = "<leader>" })

-- DAP
wk.register({
	d = {
		name = "DAP",
	},
}, { prefix = "<leader>" })

-- Harpoon
wk.register({
	a = {
		name = "Harpoon: mark file",
	},
}, { prefix = "<leader>" })
