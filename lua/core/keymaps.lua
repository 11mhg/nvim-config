vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.number = true

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- spaces and tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = false -- don't expand tab to spaces


vim.opt.undolevels = 1000
vim.opt.backup = false

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', {desc = "Remove search highlight"})
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", {desc = "Open new tab"})
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", {desc = "Close current tab"})
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", {desc = "Next tab"})
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", {desc = "Previous tab"})
