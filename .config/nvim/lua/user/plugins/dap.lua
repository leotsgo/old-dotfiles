return {
	"leoluz/nvim-dap-go",
	dependencies = {
		"theHamsta/nvim-dap-virtual-text",
		"mfussenegger/nvim-dap",
		"rcarriga/nvim-dap-ui",
	},
	lazy = false,
	config = function()
		local dap_ok, dap = pcall(require, "dap")
		local dapui_ok, dapui = pcall(require, "dapui")
		if not (dap_ok or dapui_ok) then
			return
		end

		require("nvim-dap-virtual-text").setup()
		require("dap-go").setup()
		require("dapui").setup()

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end
	end,
}
