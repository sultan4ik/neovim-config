local telescope_status, telescope = pcall(require, "telescope")
if not telescope_status then
	return
end

local actions_status, actions = pcall(require, "telescope.actions")
if not actions_status then
	return
end

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- переход к предыдущему выбору
				["<C-j>"] = actions.move_selection_next, -- переход к следующему выбору
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- отправка в быстрый список исправлений
			},
		},
	},
})

telescope.load_extension("fzf")
