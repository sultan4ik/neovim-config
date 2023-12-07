-- Utilities for creating configurations
local util = require("formatter.util")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Настройка форматировщика для lua
		lua = {
			require("formatter.filetypes.lua").stylua,

			function()
				-- Supports conditional formatting
				if util.get_current_buffer_file_name() == "special.lua" then
					return nil
				end

				-- Full specification of configurations is down below and in Vim help
				-- files
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},
		-- Настройка форматировщиков для Python
		python = {
			require("formatter.filetypes.python").autopep8,
			function()
				return {
					exe = "autopep8",
					args = { "-" },
					stdin = 1,
				}
			end,

			require("formatter.filetypes.python").isort,
			function()
				return {
					exe = "isort",
					args = { "-q", "--filename", util.escape_path(util.get_current_buffer_file_path()), "-" },
					stdin = true,
				}
			end,

			require("formatter.filetypes.python").black,
			function()
				return {
					exe = "black",
					args = { "-q", "--stdin-filename", util.escape_path(util.get_current_buffer_file_name()), "-" },
					stdin = true,
				}
			end,
		},
	},
})
