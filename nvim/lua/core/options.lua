-- Basic vim options go here (tabs, line numbers, clipboard, etc.).
-- Nothing plugin-specific — just general editor behavior I want everywhere.

local opt = vim.opt
--[[ 
[ ] Line numbers (vim.opt.number)
[ ] Relative line numbers (vim.opt.relativenumber)
[ ] Enable mouse support (vim.opt.mouse)
[ ] Use system clipboard (vim.opt.clipboard)
[ ] Scroll context (vim.opt.scrolloff / sidescrolloff)
[ ] Enable line wrap (vim.opt.wrap)

Tabs & Indentation:
[ ] Use spaces instead of tabs (vim.opt.expandtab)
[ ] Set tab width (vim.opt.tabstop)
[ ] Set indent width (vim.opt.shiftwidth)
[ ] Auto/smart indent (vim.opt.autoindent / smartindent)

Search:
[ ] Case-insensitive search (vim.opt.ignorecase)
[ ] Smart case (vim.opt.smartcase)
[ ] Highlight search results (vim.opt.hlsearch)
[ ] Live search as I type (vim.opt.incsearch)

UI & Behavior:
[ ] Enable true color (vim.opt.termguicolors)
[ ] Show cursor line (vim.opt.cursorline)
[ ] Always show sign column (vim.opt.signcolumn)
[ ] Faster keymaps (vim.opt.timeoutlen)
[ ] Faster updates (vim.opt.updatetime)
[ ] Don't redraw during macros (vim.opt.lazyredraw)
[ ] Better splits (vim.opt.splitbelow / splitright)

Files:
[ ] Disable swap files (vim.opt.swapfile)
[ ] Enable undo file (vim.opt.undofile)
[ ] Auto-reload changed files (vim.opt.autoread)

Minimal UI:
[ ] Hide mode info (vim.opt.showmode)
[ ] Show typed commands (vim.opt.showcmd)
[ ] Set command height (vim.opt.cmdheight)
[ ] Always show statusline (vim.opt.laststatus)
[ ] Show cursor position (vim.opt.ruler)
]]

