vim.opt.number = true vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "100"
vim.opt.showmatch = true
vim.opt.matchtime = 2

vim.opt.wrap = false


vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  callback = function()
    local name = vim.api.nvim_buf_get_name(0)
    if name:match("/tmp/") or name:match("%.log$") then
      vim.opt_local.swapfile = false
    end
  end,
})
vim.o.updatetime = 4000
local state = vim.fn.stdpath("state")
-- Swap files
vim.o.swapfile = true
vim.o.directory = state .. "/swap//"
-- Backup files (file~)
vim.o.backup = true
vim.o.backupdir = state .. "/backup//"
-- Persistent undo
vim.o.undofile = true
vim.o.undodir = state .. "/undo//"


vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", {desc = "Exit terminal insert"})


vim.diagnostic.config({
    virtual_text = true
})

require("config.lazy")

local builtin = require('telescope.builtin')

-- vim.keymap

-- Floating terminal settings
local terminal = require('floaterm')
terminal.setup()

vim.keymap.set({'n', 't'}, '<C-\\>', function()
    terminal.toggle()
end, { noremap = true, silent = true, desc = 'Toggle terminal' })

--vim.keymap.set('n', '<C-h>', '<C-w>h', {desc = "Navigate left"})
--vim.keymap.set('n', '<C-j>', '<C-w>j', {desc = "Navigate down"})
--vim.keymap.set('n', '<C-k>', '<C-w>k', {desc = "Navigate up"})
--vim.keymap.set('n', '<C-l>', '<C-w>l', {desc = "Navigate right"})
