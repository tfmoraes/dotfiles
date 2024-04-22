local o = vim.o
local b = vim.bo
local w = vim.wo

local indent = 2

local api = vim.api
local cache_path = vim.fn.stdpath('cache')

function create_if_not_exists(folder)
  if vim.fn.isdirectory(folder) == 0 then
    vim.fn.mkdir(folder)
  end
end

vim.g.mapleader = ","

o.termguicolors = true
b.expandtab = true -- Use spaces instead of tabs
b.shiftwidth = indent -- Size of an indent
b.smartindent = true -- Insert indents automatically
b.tabstop = indent -- Number of spaces tabs count for
b.softtabstop = indent
o.backup = true
-- o.completeopt = 'menuone,noinsert,noselect'  -- Completion options (for deoplete)
o.completeopt = "menu,menuone,noselect"
o.hidden = true -- Enable modified buffers in background
o.ignorecase = true -- Ignore case
o.infercase = true
o.joinspaces = false -- No double spaces with join after a dot
o.lazyredraw = true
o.magic = true
o.modeline = false
o.scrolloff = 4 -- Lines of context
o.secure = true
o.shiftround = true -- Round indent
o.sidescrolloff = 8 -- Columns of context
o.smartcase = true -- Don't ignore case with capitals
o.splitbelow = true -- Put new windows below current
o.splitright = true -- Put new windows right of current
o.tags = "" -- let gutentags handle this
o.termguicolors = true -- True color support
-- o.title = true
o.ttimeout = true
o.undofile = true
o.wildignorecase = true
o.wildmode = "list:longest" -- Command-line completion mode
w.list = true -- Show some invisible characters (tabs...)
w.number = true -- Print line number
w.wrap = false -- Disable line wrap
o.mouse = 'a'

o.shortmess = vim.o.shortmess .. "s"
o.shortmess = vim.o.shortmess .. "c"

local undo_path = cache_path .. "/undo"
local backup_path = cache_path .. "/backup"
local swap_path = cache_path .. "/swap"

create_if_not_exists(undo_path)
create_if_not_exists(backup_path)
create_if_not_exists(swap_path)

o.undodir = undo_path
o.backupdir = backup_path
o.directory = swap_path

vim.cmd("cab W w")
vim.cmd("cab Wq wq")
vim.cmd("cab wQ wq")
vim.cmd("cab WQ wq")
vim.cmd("cab Q q")
vim.cmd("cab q1 q!")
