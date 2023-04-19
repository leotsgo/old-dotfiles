return {
	"andweeb/presence.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("presence").setup({
			neovim_image_text = "VS Who ?",
			editing_text = "Fazendo merda em %s",
			file_explorer_text = "Fuçando %s",
		})
	end,
}
