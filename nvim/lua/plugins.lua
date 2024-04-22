require("lazy").setup({
	-- Packer can manage itself as an optional plugin
	{ "wbthomason/packer.nvim" },
	{
		"famiu/nvim-reload",
		config = function()
			local reload = require("nvim-reload")

			-- If you use Neovim's built-in plugin system
			-- Or a plugin manager that uses it (eg: packer.nvim)
			local plugin_dirs = vim.fn.stdpath("data") .. "/site/pack/*/start/*"

			-- If you use vim-plug
			-- local plugin_dirs = vim.fn.stdpath('data') .. '/plugged/*'

			reload.vim_reload_dirs = {
				vim.fn.stdpath("config"),
				plugin_dirs,
			}

			reload.lua_reload_dirs = {
				vim.fn.stdpath("config"),
				-- Note: the line below may cause issues reloading your config
				-- plugin_dirs
			}

			reload.modules_reload_external = { "packer" }

			--[[ reload.post_reload_hook = function()
          vim.cmd [[nohl]]
			-- recompile packer
			-- vim.cmd [[packadd packer.nvim]]
			-- require("plugins").compile()
			-- end ]]
		end,
	},
	--[[ {
		"NeogitOrg/neogit",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local neogit = require("neogit")
			neogit.setup({})
		end,
	}, ]]
	{ "NeogitOrg/neogit", dependencies = "nvim-lua/plenary.nvim", config = true },
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup()
		end,
	},
	--[[ use {
      "ludovicchabant/vim-gutentags",
      config = function()
        vim.g.gutentags_resolve_symlinks = 0
        vim.g.gutentags_ctags_exclude = {".direnv", ".git"}
      end
    } ]]
	{ "tpope/vim-fugitive" },
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			vim.g.indent_blankline_char = "▏"
			vim.g.indent_blankline_show_first_indent_level = false
			vim.g.indent_blankline_show_trailing_blankline_indent = false
			vim.g.indent_blankline_use_treesitter = true
		end,
	},
	{
		"chrisgrieser/nvim-puppeteer",
		dependencies = "nvim-treesitter/nvim-treesitter",
		lazy = false, -- plugin lazy-loads itself. Can also load on filetypes.
	},
	--[[ use {
      "chentau/marks.nvim",
      config = function()
        require "marks".setup {
          default_mappings = true, -- whether to map keybinds or not. default true
          builtin_marks = {".", "<", ">", "^"}, -- which builtin marks to show. default {}
          cyclic = true, -- whether movements cycle back to the beginning/end of buffer. default true
          force_write_shada = false, -- whether the shada file is updated after modifying uppercase marks. default false
          bookmark_0 = {
            -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own sign/virttext
            sign = "⚑",
            virt_text = "hello world"
          },
          mappings = {}
        }
      end
    } ]]
	--use {"svermeulen/vimpeccable"}

	-- use {"sheerun/vim-polyglot"}

	{ "npxbr/gruvbox.nvim", dependencies = { "rktjmp/lush.nvim" } },
	{ "folke/tokyonight.nvim" },
	{ "Mofiqul/dracula.nvim" },
	{ "EdenEast/nightfox.nvim" },
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "luisiacc/gruvbox-baby" },
	{
		"loctvl842/monokai-pro.nvim",
		config = function()
			require("monokai-pro").setup()
		end,
	},
	-- use {"marko-cerovac/material.nvim", requires = {"tjdevries/colorbuddy.nvim"}}
	-- use {"eddyekofo94/gruvbox-flat.nvim"}

	-- Tab line and Status line
	{ "kyazdani42/nvim-web-devicons" },
	{ "romgrk/barbar.nvim" },
	-- use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}
	-- use {"glepnir/galaxyline.nvim"}
	{ "freddiehaddad/feline.nvim" },
	--[[ use {
      "konapun/vacuumline.nvim",
      requires = {
        "glepnir/galaxyline.nvim",
        branch = "main",
        "kyazdani42/nvim-web-devicons",
        opt = true
      },
      config = function()
        require("vacuumline").setup(
          {
            theme = require("vacuumline.theme.gruvbox")
          }
        )
      end
    } -- Add this line to use defaults; otherwise, call `setup` with your config as described below wherever you configure your plugins ]]
	{
		"junegunn/fzf",
		build = function()
			vim.fn["fzf#install"]()
		end,
	},
	{ "junegunn/fzf.vim" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
		},
	},
  {"equalsraf/neovim-gui-shim"},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
		build = function()
			local job = require("plenary.job")
			job:new({
				command = "make",
				cwd = vim.fn.stdpath("data") .. "/lazy/telescope-fzf-native.nvim",
			}):sync()
		end,
		config = function()
			require("telescope").load_extension("fzf")
		end,
	},
	-- To delete surrounding chars easily
	{ "tpope/vim-surround" },
	-- Repeate some ops
	{ "tpope/vim-repeat" },
	-- Open the file on the last position before closed
	{ "dietsche/vim-lastplace" },
	-- Shows the vim undo tree
	{ "mbbill/undotree" },
	-- jump to a char based on 2 chars
	{
		"ggandor/leap.nvim",
		dependencies = { "tpope/vim-repeat" },
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	--[[ {
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					-- default options: exact mode, multi window, all directions, with a backdrop
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "o", "x" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
		},
	}, ]]
	-- LSP and Tree-sitter
	{ "neovim/nvim-lspconfig" },
	-- Autocompletion plugin
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "williamboman/nvim-lsp-installer" },
	{
		"folke/lsp-trouble.nvim",
		config = function()
			require("trouble").setup({})
		end,
	},
	{
		"onsails/lspkind-nvim",
		config = function()
			require("lspkind").init({})
		end,
	},
	{ "ray-x/lsp_signature.nvim" },
	{ "nvim-lua/lsp-status.nvim" },
	-- Tree-sitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	{ "p00f/nvim-ts-rainbow" },
	{
		"mizlan/iswap.nvim",
		config = function()
			require("iswap").setup({})
		end,
	},
	--[[ use {
      "liuchengxu/vista.vim",
      config = function()
        vim.g.vista_default_executive = "nvim_lsp"
        vim.cmd("autocmd VimEnter * call vista#RunForNearestMethodOrFunction()")
      end
    } ]]
	{ "simrat39/symbols-outline.nvim" },
	{
		"SmiteshP/nvim-navic",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			local navic = require("nvim-navic")
			navic.setup({
				lsp = {
					auto_attach = true,
				},
			})
		end,
	},
	-- Syntax
	{ "lnl7/vim-nix" },
	-- latex
	{
		"lervag/vimtex",
		config = function()
			vim.g.vimtex_compiler_latexmk = { build_dir = "build" }
			if vim.loop.os_uname().sysname == "Darwin" then
				vim.g.vimtex_view_method = "skim"
				vim.g.vimtex_view_skim_sync = 1
			else
				vim.g.vimtex_view_method = "zathura"
			end
		end,
	},
	{
		"abeleinin/papyrus",
		dependencies = { "vim-pandoc/vim-pandoc-syntax" },
		ft = "markdown",
		config = function()
			vim.g.papyrus_latex_engine = "xelatex"
		end,
	},
	{
		"habamax/vim-asciidoctor",
		ft = "asciidoctor",
		config = function()
			vim.g.asciidoctor_extensions = { "asciidoctor-diagram", "asciidoctor-rouge", "asciidoctor-bibtex" }
			vim.g.asciidoctor_syntax_conceal = 1
			vim.g.asciidoctor_syntax_indented = 1
			vim.api.nvim_create_autocmd("BufWritePost", {
				pattern = "*.adoc",
				callback = function(args)
					vim.cmd([[ :execute "silent normal! mq" ':Asciidoctor2HTML' "\r`q" ]])
				end,
				desc = "Tell me when I enter a buffer",
			})
		end,
	},
	-- {'iamcco/markdown-preview.nvim'},
	{ "davidgranstrom/nvim-markdown-preview" },
	{ "dhruvasagar/vim-table-mode" },
  {"IndianBoy42/tree-sitter-just"},
	-- Snippets
	{ "L3MON4D3/LuaSnip" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "rafamadriz/friendly-snippets" },
  { "microsoft/python-type-stubs" },
  {"wilriker/gcode.vim"},
	{
		"tpope/vim-endwise",
		config = function()
			vim.g.endwise_no_mappings = 1
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{ "ntpeters/vim-better-whitespace" },
	{
		"bfredl/nvim-miniyank",
		config = function()
			local data_path = vim.fn.stdpath("data")
			vim.g.miniyank_filename = data_path .. "/.miniyank.mpack"
		end,
	},
	{ "b3nj5m1n/kommentary" },
	{
		"akinsho/nvim-toggleterm.lua",
		config = function()
			require("toggleterm").setup({
				size = 20,
				open_mapping = [[<c-\>]],
				shade_filetypes = {},
				shade_terminals = true,
				shading_factor = 1, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
				start_in_insert = true,
				persist_size = true,
				direction = "horizontal",
			})
		end,
	},
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	},
	--[[ {
		"mhartington/formatter.nvim",
	}, ]]
  {
    'stevearc/conform.nvim',
    opts = {},
  },
})
