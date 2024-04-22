vim.g.mapleader = ","
require('bootstrap_lazy')
require('basic')
require('plugins')
require('colors')
require('lsp_conf')
require('lsp_completion')
require('telescope_config')
require('barbar_conf')
require('statusline')
require('treesiter_conf')
require('maps_conf')
require('formatting')
require('neovide')
require('languages')

if vim.fn.filereadable("lua/local_confs.lua") == 1 then
  require("local_confs")
end
