return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup()

		-- UI Auto-open/close
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		-- 1. Configure the Adapter (Native GDB DAP)
		-- Requires GDB 14.1+
		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = { "--interpreter=dap" },
		}

		-- 2. Configure C/C++ launch settings
		local gdb_config = {
			{
				name = "Launch",
				type = "gdb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopAtBeginningOfMainSubprogram = false,
			},
			{
				name = "Attach to process",
				type = "gdb",
				request = "attach",
				processId = require("dap.utils").pick_process,
				cwd = "${workspaceFolder}",
			},
		}

		-- Apply the same config to c, cpp, and rust
		dap.configurations.c = gdb_config
		dap.configurations.cpp = gdb_config
		dap.configurations.rust = gdb_config

		-- Standard Debugging Keymaps
		vim.keymap.set("n", "<F5>", function()
			require("dap").continue()
		end, { desc = "Debug: Start/Continue" })
		vim.keymap.set("n", "<F10>", function()
			require("dap").step_over()
		end, { desc = "Debug: Step Over" })
		vim.keymap.set("n", "<F11>", function()
			require("dap").step_into()
		end, { desc = "Debug: Step Into" })
		vim.keymap.set("n", "<F12>", function()
			require("dap").step_out()
		end, { desc = "Debug: Step Out" })
		vim.keymap.set("n", "<leader>b", function()
			require("dap").toggle_breakpoint()
		end, { desc = "Debug: Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>B", function()
			require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "Debug: Set Conditional Breakpoint" })

		-- Toggle UI manually
		vim.keymap.set("n", "<leader>du", function()
			require("dapui").toggle()
		end, { desc = "Debug: Toggle UI" })
	end,
}

-- return {
-- 	"mfussenegger/nvim-dap",
-- 	dependencies = {
-- 		"rcarriga/nvim-dap-ui",
-- 		"nvim-neotest/nvim-nio",
-- 	},
-- 	config = function()
-- 		local dap = require("dap")
-- 		local dapui = require("dapui")
--
-- 		dapui.setup()
--
-- 		-- Automatically open/close UI when debugging starts/ends
-- 		dap.listeners.after.event_initialized["dapui_config"] = function()
-- 			dapui.open()
-- 		end
-- 		dap.listeners.before.event_terminated["dapui_config"] = function()
-- 			dapui.close()
-- 		end
-- 		dap.listeners.before.event_exited["dapui_config"] = function()
-- 			dapui.close()
-- 		end
--
-- 		-- 3. Configure the Adapter (GDB)
-- 		dap.adapters.gdb = {
-- 			type = "executable",
-- 			command = "gdb",
-- 			args = { "-i", "mi" },
-- 		}
--
-- 		-- 4. Configure C launch settings
-- 		dap.configurations.c = {
-- 			{
-- 				name = "Launch",
-- 				type = "gdb",
-- 				request = "launch",
-- 				program = function()
-- 					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
-- 				end,
-- 				cwd = "${workspaceFolder}",
-- 				stopAtBeginningOfMainSubprogram = false,
-- 			},
-- 		}
--
-- 		return {
-- 			"mfussenegger/nvim-dap",
-- 			dependencies = {
-- 				"rcarriga/nvim-dap-ui",
-- 				"nvim-neotest/nvim-nio",
-- 			},
-- 			config = function()
-- 				local dap = require("dap")
-- 				local dapui = require("dapui")
--
-- 				dapui.setup()
--
-- 				-- Automatically open/close UI when debugging starts/ends
-- 				dap.listeners.after.event_initialized["dapui_config"] = function()
-- 					dapui.open()
-- 				end
-- 				dap.listeners.before.event_terminated["dapui_config"] = function()
-- 					dapui.close()
-- 				end
-- 				dap.listeners.before.event_exited["dapui_config"] = function()
-- 					dapui.close()
-- 				end
--
-- 				-- 3. Configure the Adapter (GDB)
-- 				dap.adapters.gdb = {
-- 					type = "executable",
-- 					command = "gdb",
-- 					args = { "-i", "mi" },
-- 				}
--
-- 				-- 4. Configure C launch settings
-- 				dap.configurations.c = {
-- 					{
-- 						name = "Launch",
-- 						type = "gdb",
-- 						request = "launch",
-- 						program = function()
-- 							return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
-- 						end,
-- 						cwd = "${workspaceFolder}",
-- 						stopAtBeginningOfMainSubprogram = false,
-- 					},
-- 				}
-- 			end,
-- 		}
-- 	end,
-- }

-- return {
-- 	"mfussenegger/nvim-dap",
-- 	dependencies = {
-- 		"rcarriga/nvim-dap-ui",
-- 		"nvim-neotest/nvim-nio",
-- 	},
-- 	config = function()
-- 		local dap = require("dap")
-- 		local dapui = require("dapui")
-- 		dap.listeners.before.attach.dapui_config = function()
-- 			dapui.open()
-- 		end
-- 		dap.listeners.before.launch.dapui_config = function()
-- 			dapui.open()
-- 		end
-- 		dap.listeners.before.event_terminated.dapui_config = function()
-- 			dapui.close()
-- 		end
-- 		dap.listeners.before.event_exited.dapui_config = function()
-- 			dapui.close()
-- 		end
--
-- 		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {})
-- 		vim.keymap.set("n", "<leader>dc", dap.continue, {})
--
-- 		dapui.setup()
--
-- 		-- Automatically open/close UI
-- 		dap.listeners.after.event_initialized["dapui_config"] = function()
-- 			dapui.open()
-- 		end
-- 		dap.listeners.before.event_terminated["dapui_config"] = function()
-- 			dapui.close()
-- 		end
-- 		dap.listeners.before.event_exited["dapui_config"] = function()
-- 			dapui.close()
-- 		end
--
-- 		-- 2. Adapter Configuration
-- 		-- Change the path below to where you extracted js-debug
--     local js_debug_path = "/home/martin/dev/utils/js-debug/js-debug/src/dapDebugServer.js"
-- 		dap.adapters["pwa-node"] = {
-- 			type = "server",
-- 			host = "localhost",
-- 			port = "${port}",
-- 			executable = {
-- 				command = "node",
-- 				args = { js_debug_path, "${port}" },
-- 			},
-- 		}
--
-- 		-- 3. Language Configurations
-- 		local common_js_config = {
-- 			{
-- 				type = "pwa-node",
-- 				request = "launch",
-- 				name = "Launch Current File",
-- 				program = "${file}",
-- 				cwd = "${workspaceFolder}",
-- 				sourceMaps = true,
-- 			},
-- 			{
-- 				type = "pwa-node",
-- 				request = "attach",
-- 				name = "Attach to Process",
-- 				processId = require("dap.utils").pick_process,
-- 				cwd = "${workspaceFolder}",
-- 			},
-- 		}
--
-- 		dap.configurations.javascript = common_js_config
--
-- 		-- TypeScript specific: Adds ts-node support to run without pre-compiling
-- 		dap.configurations.typescript = {
-- 			{
-- 				type = "pwa-node",
-- 				request = "launch",
-- 				name = "Launch TypeScript File (ts-node)",
-- 				program = "${file}",
-- 				cwd = "${workspaceFolder}",
-- 				runtimeArgs = { "--loader", "ts-node/register" },
-- 				sourceMaps = true,
-- 				protocol = "inspector",
-- 				console = "integratedTerminal",
-- 			},
-- 		}
--
-- 		-- 4. Keymaps
-- 		-- Breakpoints and execution
-- 		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
-- 		vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP: Continue/Start" })
--
-- 		-- Stepping
-- 		vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP: Step Over" })
-- 		vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP: Step Into" })
-- 		vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP: Step Out" })
--
-- 		-- UI Toggle
-- 		vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "DAP: Toggle UI" })
-- 		dapui.setup()
--
-- 		-- 2. Adapter Configuration
-- 		-- Change the path below to where you extracted js-debug
-- 		local js_debug_path = os.getenv("HOME") .. "/dev/utils/js-debug/src/dapDebugServer.js"
--
-- 		dap.adapters["pwa-node"] = {
-- 			type = "server",
-- 			host = "localhost",
-- 			port = "${port}",
-- 			executable = {
-- 				command = "node",
-- 				args = { js_debug_path, "${port}" },
-- 			},
-- 		}
--
-- 		-- 3. Language Configurations
-- 		local common_js_config = {
-- 			{
-- 				type = "pwa-node",
-- 				request = "launch",
-- 				name = "Launch Current File",
-- 				program = "${file}",
-- 				cwd = "${workspaceFolder}",
-- 				sourceMaps = true,
-- 			},
-- 			{
-- 				type = "pwa-node",
-- 				request = "attach",
-- 				name = "Attach to Process",
-- 				processId = require("dap.utils").pick_process,
-- 				cwd = "${workspaceFolder}",
-- 			},
-- 		}
--
-- 		dap.configurations.javascript = common_js_config
--
-- 		-- TypeScript specific: Adds ts-node support to run without pre-compiling
-- 		dap.configurations.typescript = {
-- 			{
-- 				type = "pwa-node",
-- 				request = "launch",
-- 				name = "Launch TypeScript File (ts-node)",
-- 				program = "${file}",
-- 				cwd = "${workspaceFolder}",
-- 				runtimeArgs = { "--loader", "ts-node/register" },
-- 				sourceMaps = true,
-- 				protocol = "inspector",
-- 				console = "integratedTerminal",
-- 			},
-- 		}
--
-- 		-- 4. Keymaps
-- 		-- Breakpoints and execution
-- 		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
-- 		vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP: Continue/Start" })
--
-- 		-- Stepping
-- 		vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP: Step Over" })
-- 		vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP: Step Into" })
-- 		vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP: Step Out" })
--
-- 		-- UI Toggle
-- 		vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "DAP: Toggle UI" })
-- 	end,
-- }
