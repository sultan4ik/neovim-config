-- Настройка комбинаций клавиш

vim.g.mapleader = " "       -- Настройка пробела в качестве стартового символа

local keymap = vim.keymap   -- Локальная переменная для сокращения инструкций
 
-- Структура инструкции: режим(i, n, v), заменяющая и заменяемая комбинации

-- Основные комбинации
keymap.set("n", "<leader>sv", "<C-w>v")         -- Разделение окна по вертикали
keymap.set("n", "<leader>sh", "<C-w>s")         -- Разделение окна по горизонтали
keymap.set("n", "<leader>se", "<C-w>=")         -- Выравнивание окон по размеру
keymap.set("n", "<leader>sx", ":close<CR>")     -- Закрыть текущее окно

keymap.set("n", "<leader>to", ":tabnew<CR>")    -- Открытие нового окна
keymap.set("n", "<leader>tx", ":tabclose<CR>")  -- Закрытие текущего окна
keymap.set("n", "<leader>tn", ":tabn<CR>")      -- Переход к следующему окну
keymap.set("n", "<leader>tp", ":tabp<CR>")      -- Переход к предыдущему окну

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")   -- Увеличение разделенного окна и возвращение его к изначальному размеру

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")     -- Открытие и закрытие проводника

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")  -- поиск файла в проекте
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")   -- поиск строки в проекте
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- поиск текущей строки в проекте
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")     -- активный буфер
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")   -- теги справки
