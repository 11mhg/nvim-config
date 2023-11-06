vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
	filters = {
		dotfiles = false,
	},
	git = {
		ignore = false,
	},
})

vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>', { desc = "Toggle nvim-tree" })
