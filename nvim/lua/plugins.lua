local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.api.nvim_command('packadd packer.nvim')
end

vim.api.nvim_command('packadd packer.nvim')

require("packer").startup(
  function()
    -- Packer can manage itself as an optional plugin
    use {"wbthomason/packer.nvim", opt = true}

    use {
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
          plugin_dirs
        }

        reload.lua_reload_dirs = {
          vim.fn.stdpath("config"),
          -- Note: the line below may cause issues reloading your config
          plugin_dirs
        }

        reload.modules_reload_external = {"packer"}
      end
    }

    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim', config=function()
      local neogit = require('neogit')
      neogit.setup {}
    end}

    --use {"svermeulen/vimpeccable"}

    use {"sheerun/vim-polyglot"}

    use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
    use {"folke/tokyonight.nvim"}
    use {"Mofiqul/dracula.nvim"}
    -- use {"marko-cerovac/material.nvim", requires = {"tjdevries/colorbuddy.nvim"}}
    -- use {"eddyekofo94/gruvbox-flat.nvim"}

    use {"kyazdani42/nvim-web-devicons"}
    use {"romgrk/barbar.nvim"}
    -- use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}
    use {"glepnir/spaceline.vim"}

    use {
      "junegunn/fzf",
      run = function()
        vim.fn["fzf#install"]()
      end
    }

    use {"nvim-lua/popup.nvim"}
    use {"nvim-lua/plenary.nvim"}
    use {"nvim-telescope/telescope.nvim"}
    use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}

    -- To delete surrounding chars easily
    use {"tpope/vim-surround"}

    -- Repeate some ops
    use {"tpope/vim-repeat"}

    -- Open the file on the last position before closed
    use {"dietsche/vim-lastplace"}

    -- Shows the vim undo tree
    use {"mbbill/undotree"}

    -- jump to a char based on 2 chars
    use {
      "ggandor/lightspeed.nvim",
      config = function()
        require("lightspeed").setup {}
      end
    }

    -- LSP and Tree-sitter
    use {"neovim/nvim-lspconfig"}
    use {"hrsh7th/nvim-compe"}
    use {"liuchengxu/vista.vim"}
    use {"nvim-treesitter/nvim-treesitter"}
    use {"kabouzeid/nvim-lspinstall"}
    use {
      "folke/lsp-trouble.nvim",
      config = function()
        require("trouble").setup {}
      end
    }
    use {
      "onsails/lspkind-nvim",
      config = function()
        require("lspkind").init({})
      end
    }
    use {"ray-x/lsp_signature.nvim"}

    -- Snippets
    use {"hrsh7th/vim-vsnip"}
    use {"rafamadriz/friendly-snippets"}

    use {"simrat39/symbols-outline.nvim"}

    use {
      "tpope/vim-endwise",
      config = function()
        vim.g.endwise_no_mappings = 1
      end
    }
    use {"jiangmiao/auto-pairs"}

    use {
      "bfredl/nvim-miniyank",
      config = function()
        local data_path = vim.fn.stdpath("data")
        vim.g.miniyank_filename = data_path .. "/.miniyank.mpack"
      end
    }

    use {"b3nj5m1n/kommentary"}

    use {
      "akinsho/nvim-toggleterm.lua",
      config = function()
        require "toggleterm".setup {
          size = 20,
          open_mapping = [[<c-\>]],
          shade_filetypes = {},
          shade_terminals = true,
          shading_factor = 1, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
          start_in_insert = true,
          persist_size = true,
          direction = "horizontal"
        }
      end
    }

    use {
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup {}
      end
    }

    use {
      "mhartington/formatter.nvim",
      config = function()
        require("formatter").setup(
          {
            logging = false,
            filetype = {
              lua = {
                -- luafmt
                function()
                  return {
                    exe = "luafmt",
                    args = {"--indent-count", 2, "--stdin"},
                    stdin = true
                  }
                end
              },
              nix = {
                --nixpkgs-fmt
                function()
                  return {
                    exe = "nixpkgs-fmt",
                    stdin = true
                  }
                end
              }
            }
          }
        )
      end
    }
  end
)

vim.cmd("colorscheme gruvbox")
