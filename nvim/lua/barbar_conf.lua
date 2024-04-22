local opts = {silent = true}

-- Magic buffer-picking mode
vim.api.nvim_set_keymap("n", "<C-s>", ":BufferPick<CR>", opts)

-- Sort automatically by...
vim.api.nvim_set_keymap("n", "<Space>bd", ":BufferOrderByDirectory<CR>", opts)
vim.api.nvim_set_keymap("n", "<Space>bl", ":BufferOrderByLanguage<CR>", opts)

-- Move to previous/next
vim.api.nvim_set_keymap("n", "<leader>,", ":BufferPrevious<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>.", ":BufferNext<CR>", opts)

-- Re-order to previous/next
vim.api.nvim_set_keymap("n", "<leader><", ":BufferMovePrevious<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>>", ":BufferMoveNext<CR>", opts)

-- Goto buffer in position...
vim.api.nvim_set_keymap("n", "<leader>1", ":BufferGoto 1<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>2", ":BufferGoto 2<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>3", ":BufferGoto 3<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>4", ":BufferGoto 4<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>5", ":BufferGoto 5<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>6", ":BufferGoto 6<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>7", ":BufferGoto 7<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>8", ":BufferGoto 8<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>9", ":BufferLast<CR>", opts)

-- Close buffer
vim.api.nvim_set_keymap("n", "<leader>c", ":BufferClose<CR>", opts)
