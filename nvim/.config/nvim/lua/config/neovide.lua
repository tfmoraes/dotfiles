local cmd, g = vim.cmd, vim.g

if vim.fn.exists('g:neovide') ~= 0 then
    cmd[[set guifont=JetBrainsMono\ Nerd\ Font:h12]]
    g.neovide_cursor_animation_length=0.0
    g.neovide_cursor_trail_length=0.0
    g.neovide_cursor_antialiasing = false
    g.neovide_cursor_vfx_mode = 'sonicboom'
    g.neovide_cursor_vfx_opacity = 0
    g.neovide_cursor_vfx_particle_lifetime=0
end
