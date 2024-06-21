-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local o = vim.o
local cmd, g = vim.cmd, vim.g
o.completeopt = "menu,menuone,noselect"

if vim.fn.exists("g:neovide") ~= 0 then
  cmd([[set guifont=SauceCodePro\ Nerd\ Font:h14]])
  g.neovide_cursor_animation_length = 0.0
  g.neovide_cursor_trail_length = 0.0
  g.neovide_cursor_antialiasing = false
  g.neovide_cursor_vfx_mode = "sonicboom"
  g.neovide_cursor_vfx_opacity = 0
  g.neovide_cursor_vfx_particle_lifetime = 0
end
