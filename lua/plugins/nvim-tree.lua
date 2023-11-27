-- Настройки nvim-tree
local status, nvimtree = pcall(require, 'nvim-tree')
if not status then
    return
end

-- Рекомендуемые настройки из документации
vim.g.loaded = 1
vim.g.loaded_newtrwPlugin = 1

nvimtree.setup({
  -- смена иконок стрелок у папок
  renderer = {
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "→", -- стрелка закрытой папки
          arrow_open = "↓", -- стрелка открытой папки
        },
      },
    },
  },
  -- отключение window_picker для нормальной работы с разделителями окон
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
}
)
