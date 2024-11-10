-- Функция для установки менеджера пакетов packer.vim, если он не установлен
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer() -- Переменная будет true, если packer установлен только что

-- Команда для перезапуска neovim и установки/обновления/удаления плагинов при сохранении файла
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
    augroup end
]])

-- Безопасный импорт packer
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- Установка плагинов
return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- управление packer'а самим собой
	use("nvim-lua/plenary.nvim") -- необходим для многих плагинов

	use("morhetz/gruvbox") -- цветовая схема gruvbox

	use("christoomey/vim-tmux-navigator") -- tmux и навигация между разделенными окнами
	use("szw/vim-maximizer") -- увеличение и сброс текущих окон

	use("tpope/vim-surround") -- для работы с кавычками(хз)
	use("vim-scripts/ReplaceWithRegister") -- для вставки(хз)
	use("numToStr/Comment.nvim") -- комментирование

	use("nvim-tree/nvim-tree.lua") -- файловый менеджер

	use("kyazdani42/nvim-web-devicons") -- иконки

	use("nvim-lualine/lualine.nvim") -- строка статуса

	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- fuzzy finding(поиск по сходству)
	use({ "nvim-telescope/telescope.nvim", brache = "0.1.x" }) -- телескоп опредлененной ветки

	use("hrsh7th/nvim-cmp") -- базовое автодополнение
	use("hrsh7th/cmp-buffer") -- автодополнение по данными из буфера
	use("hrsh7th/cmp-path") -- автодополнение по данными из путей файлов

	use("L3MON4D3/LuaSnip") -- движок для сниппетов
	use("saadparwaiz1/cmp_luasnip") -- еще один источник для автодополнений
	use("rafamadriz/friendly-snippets") -- множество полезных сниппетов

	use("williamboman/mason.nvim") -- управление LSP-сервером, линтерами и форматироващиками
	use("williamboman/mason-lspconfig.nvim") -- прослойка между mason и lspconfig
	use("neovim/nvim-lspconfig") -- конфигурация LSP-сервера
	use("hrsh7th/cmp-nvim-lsp") -- для автодополнения
	use({
		"glepnir/lspsaga.nvim", -- усовершенствованный пользовательский интерфейс
		--     branch = "main",
		--     requires = {
		--         {
		--             "nvim-tree/nvim-web-devicons"
		--         },
		--         {
		--             "nvim-treesitter/nvim-treesitter"
		--         },
		--     },
	})
	use("onsails/lspkind.nvim") -- значки в окна автодополнения

	use("windwp/nvim-autopairs") -- автозакрытие скобок

	use({
		"nvim-treesitter/nvim-treesitter", -- подсветка синтаксиса
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	use("lewis6991/gitsigns.nvim") -- git команды

	use({ "mhartington/formatter.nvim" }) -- форматировщик

	use("mfussenegger/nvim-lint") -- линтеры

	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function() -- терминал
			require("toggleterm").setup()
		end,
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
