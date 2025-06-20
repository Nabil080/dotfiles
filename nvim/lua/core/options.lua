-- Basic vim options go here (tabs, line numbers, clipboard, etc.).
-- Nothing plugin-specific — just general editor behavior I want everywhere.

local opt = vim.opt

-- numbers
opt.relativenumber = true
opt.number = true

-- clipboard
opt.clipboard = "unnamedplus"

-- tabs & indentation
opt.tabstop = 4       -- 4 spaces for tabs (prettier default)
opt.shiftwidth = 4    -- 4 spaces for indent width
opt.expandtab = true  -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true  -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor 
opt.cursorline = true -- highlight cursor position
opt.scrolloff = 10 -- x scroll offset
opt.sidescrolloff = 10 -- x scroll offset

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- file
opt.swapfile = false -- swapfile
opt.autoread = true -- auto reload on external change

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- Explorer tree style
vim.cmd("let g:netrw_liststyle = 3")

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- WARNING `vim.o.sessionoptions` should contain 'localoptions' to make sure
-- filetype and highlighting work correctly after a session is restored.
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
