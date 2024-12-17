return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"leoluz/nvim-dap-go",
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"williamboman/mason.nvim",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dap.adapters.go = {
			type = "executable",
			command = "dlv",
			args = { "dap" },
			options = {
				env = vim.fn.environ(),
			},
		}

		dap.adapters.coreclr = {
			type = 'executable',
			command = vim.fn.stdpath("data") .. "/mason/packages/netcoredbg/netcoredbg/netcoredbg.exe",
			args = { '--interpreter=vscode' }
		}

		dap.configurations.cs = {
			{
				type = "coreclr",
				name = "launch - netcoredbg",
				request = "launch",
				program = function()
					return vim.fn.input('Path to dll >>> ', vim.fn.getcwd() .. '/bin/Debug/net8.0/', 'file')
				end,
			},
		}

		require("dapui").setup()
		require("dap-go").setup({
			dap_configurations = {
				type = "go",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				-- program = "${workspaceFolder}/cmd/main.go",
			},
			delve = {
				path = "dlv",
			},
		})
		require("nvim-dap-virtual-text").setup()

		-- local go_debugger = vim.fn.exepath("dlv")

		vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
		vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

		-- Eval var under cursor
		vim.keymap.set("n", "<F5>", dap.continue)
		vim.keymap.set("n", "<F1>", dap.step_over)
		vim.keymap.set("n", "<F2>", dap.step_into)
		-- vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
		-- vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
		-- vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)

		-- Open dap-ui automatically when debugging starts
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end

		-- Close dap-ui automatically when debugging ends
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end
	end,
}
