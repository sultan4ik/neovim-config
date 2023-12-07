-- Настройка комбинаций клавиш
vim.g.mapleader = " "                                               --  Пробел в качестве стартового символа

local keymap = vim.keymap                                           -- Локальная переменная для упрощения инструкций

-- Структура инструкции: режим(i-insert, n-normal, v-visual), заменяющая и заменяемая комбинации

-- Основные комбинации
keymap.set("n", "<leader>sv", "<C-w>v")                             -- Разделение окна по вертикали
keymap.set("n", "<leader>sh", "<C-w>s")                             -- Разделение окна по горизонтали
keymap.set("n", "<leader>se", "<C-w>=")                             -- Выравнивание окон по размеру
keymap.set("n", "<leader>sx", ":close<CR>")                         -- Закрыть текущее окно

keymap.set("n", "<leader>to", ":tabnew<CR>")                        -- Открытие новой вкладки
keymap.set("n", "<leader>tx", ":tabclose<CR>")                      -- Закрытие текущей вкладки
keymap.set("n", "<leader>tn", ":tabn<CR>")                          -- Переход к следующей вкладке
keymap.set("n", "<leader>tp", ":tabp<CR>")                          -- Переход к предыдущей вкдадке

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")               -- Увеличение разделенного окна и возaращение его к изначальному размеру

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")                 -- Открытие и закрытие проводника

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")      -- Поиск файла в проектах
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")       -- Поиск строки в проектах
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")     -- Поиск текущей строки в проектах
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")         -- Активный буфер
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")       -- Теги справки

