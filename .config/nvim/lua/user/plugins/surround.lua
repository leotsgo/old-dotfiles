return {
	"kylechui/nvim-surround",
	event = { "BufRead", "BufNewFile", "BufWinEnter", "BufWinLeave" },
	config = function()
		local status_ok, surround = pcall(require, "nvim-surround")
		if not status_ok then
			return
		end

		surround.setup({})
	end,
}
