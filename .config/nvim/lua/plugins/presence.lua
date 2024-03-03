return {
	"andweeb/presence.nvim",
	config = function()
		require("presence"):setup({
			editing_text = "Breaking stuff in %s",
			file_explorer_text = "Looking what to break in %s",
		})
	end,
}
