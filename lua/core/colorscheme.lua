-- Настройка цветовых схем

-- Безопасный вызов цветовой схемы с проверкой на существование
local status, gruvbox = pcall(vim.cmd, "colorscheme gruvbox")

if not status then
    print('Цветовая схема gruvbox не найдена!')
    return
end

