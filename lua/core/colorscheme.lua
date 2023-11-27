-- Настройка цветовых схем

-- Безопасный вызов цветовой схемы(проверка на существование)
local status, _ = pcall(vim.cmd, "colorscheme gruvbox")
if not status then
    print('Цветовая схема gruvbox не найдена!')
    return
end
