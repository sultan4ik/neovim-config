-- Основная конфигурация NeoVim

local opt = vim.opt                 -- Переменная для установки опций

opt.swapfile = false                -- Не создавать swap-файлы
opt.mouse = 'a'                     -- Включение мыши
opt.clipboard = 'unnamedplus'       -- Копирование/вставка из системного буфера

opt.relativenumber = true           -- Относительная нумерация строк
opt.number = true                   -- Основная нумерация строк
opt.colorcolumn = "120"             -- Вертикальная граница в 120 символов
opt.showmatch = true                -- Выделение парных скобок
opt.splitright = true               -- Вертикальное разделение вправо
opt.splitbelow = true               -- Горизонтальное разделение вниз
opt.termguicolors = true            -- Включение 24-битных RGB-цветов
opt.laststatus = 3                  -- Установка глобальной строки состояния
opt.background = 'dark'             -- Выбор темного варианта цветовых схем
opt.signcolumn = 'yes'              -- Отрисовка столбца при заполненных строках
opt.cursorline = true               -- Подсветка текущей строки 

opt.backspace = 'indent,eol,start'  -- Настройка удаления по стандарту
opt.wrap = false                     -- Отключение переноса строк
opt.iskeyword:append('-')           -- Тире - часть слова

opt.ignorecase = true               -- Игнорирование регистра при поиске
opt.smartcase = true                -- Игнорирование строчных букв в шаблоне

opt.tabstop = 4                     -- 1 таб = 4 пробела
opt.shiftwidth = 4                  -- Замена таба 4 пробелами
opt.expandtab = true                -- Использование пробелов вместо таба
opt.autoindent = true               -- Автоотступ для новых строк

