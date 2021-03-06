local treesitter = require'nvim-treesitter.configs'

treesitter.setup{
	highlight = {
		enable = true,
	},
	indent = { 
		enable = true,
		disable = { 'blade' , 'vue' },
	},
	incremental_selection = {
		enable = true,
		keymaps = {                       -- mappings for incremental selection (visual mappings)
			init_selection = 'gnn',         -- maps in normal mode to init the node/scope selection
			node_incremental = "grn",       -- increment to the upper named parent
			scope_incremental = "grc",      -- increment to the upper scope (as defined in locals.scm)
			scope_decremental = "grm",      -- decrement to the previous scope
		}
	},
}
