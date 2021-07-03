local t = require("telescope")
local tb = require("telescope.builtin")
local opts = {noremap = true}

t.setup {
  extensions = {
    fzf = {
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case" -- or "ignore_case" or "respect_case"
    }
  }
}

t.load_extension("fzf")

vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>Telescope find_files<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>b", "<cmd>Telescope buffers<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>r", "<cmd>Telescope live_grep<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>g", "<cmd>Telescope lsp_references<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>q", "<cmd>Telescope quickfix<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>l", "<cmd>Telescope loclist<CR>", opts)
