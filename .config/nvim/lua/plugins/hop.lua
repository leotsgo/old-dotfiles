return {
	"phaazon/hop.nvim",
	version = "*",
	event = "BufRead",
	config = function()
		require("hop").setup()
	end,
}

