local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files in a fuzzy way" })
vim.keymap.set('n', '<leader>fr', builtin.git_files, {  desc = "Find files using git in a fuzzy way" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Grep for text" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "List all open buffers" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "List available help tags" })

vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = "List all normal mode keymappings" })

