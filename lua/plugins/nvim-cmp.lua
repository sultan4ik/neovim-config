-- Настройка автодополнения
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	return
end

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
	return
end

local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
	return
end

-- подкгрузка сниппетов из плагина
require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	mapping = cmp.mapping.preset.insert({
		-- ["<Tab>"] = cmp.mapping.select_prev_item(),      -- предыдущее предложение
		["<Tab>"] = cmp.mapping.select_next_item(), -- следующее предложение
		["<C-b>"] = cmp.mapping.scroll_docs(-4), -- проскроллить доку по предложению вниз
		["<C-f>"] = cmp.mapping.scroll_docs(4), -- проскроллить доку по предложению вверх
		["<C-Space>"] = cmp.mapping.complete(), -- показать подробное предложение
		["<C-e>"] = cmp.mapping.abort(), -- закрыть окно предложений
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	}),
	-- источники автодополнения
	sources = cmp.config.sources({
		{ name = "nvim_lsp" }, -- lsp
		{ name = "luasnip" }, -- сниппеты
		{ name = "buffer" }, -- текст из текущего буфера
		{ name = "path" }, -- пути из файловой системы
	}),
	-- configure lspkind for vs-code like icons
	formatting = {
		format = lspkind.cmp_format({
			maxwidth = 50,
			ellipsis_char = "...",
		}),
	},
})
