vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint("pylint")
	end,
})

require("lint").linters_by_ft = {
	python = { "pylint" },
}
