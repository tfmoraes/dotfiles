-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

if require("lazyvim.util").has("bufferline.nvim") then
  for i = 1, 9 do
    vim.keymap.set("n", "<leader>" .. i, function()
      require("bufferline").go_to(i, true)
    end, { desc = "Buffer " .. i, silent = true })
  end
end

vim.keymap.set("ca", "W", "w")
vim.keymap.set("ca", "Wq", "wq")
vim.keymap.set("ca", "wQ", "wq")
vim.keymap.set("ca", "WQ", "wq")
vim.keymap.set("ca", "Q", "q")
vim.keymap.set("ca", "q1", "q!")
