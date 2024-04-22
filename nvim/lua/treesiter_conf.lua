local treesitter = require "nvim-treesitter.configs"

require("nvim-treesitter.parsers").get_parser_configs().just = {
  install_info = {
    url = "https://github.com/IndianBoy42/tree-sitter-just", -- local path or git repo
    files = { "src/parser.c", "src/scanner.c" },
    branch = "main",
    -- use_makefile = true -- this may be necessary on MacOS (try if you see compiler errors)
  },
  maintainers = { "@IndianBoy42" },
}

treesitter.setup {
  highlight = {
    enable = true
  },
  indent = {
    enable = true,
    disable = {"blade", "vue", "python"}
  },
  folding = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    disable = {"latex"},
    keymaps = {
      -- mappings for incremental selection (visual mappings)
      init_selection = "gnn", -- maps in normal mode to init the node/scope selection
      node_incremental = "grn", -- increment to the upper named parent
      scope_incremental = "grc", -- increment to the upper scope (as defined in locals.scm)
      -- scope_decremental = "grm" -- decrement to the previous scope
    }
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
