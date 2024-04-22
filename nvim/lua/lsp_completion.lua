-- nvim-cmp setup
local cmp = require("cmp")
local lspkind = require("lspkind")
local luasnip = require("luasnip")

require("luasnip/loaders/from_vscode").load()

local function has_words_before()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

local function feedkeys(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup {
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end
  },
  completion = {
    completeopt = "menu,menuone,noselect"
  },
  formatting = {
    format = function(_, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind
      return vim_item
    end
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    },
    ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "s"}),
    ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "s"}),
    ["<Up>"] = cmp.mapping.select_prev_item(),
    ["<Down>"] = cmp.mapping.select_next_item(),
  },
  sources = {
    {name = "nvim_lsp"},
    {name = "luasnip"},
    {name = "buffer"},
    {name = "path"}
  },
  experimental = {
    -- I like the new menu better! Nice work hrsh7th
    native_menu = false,
    -- Let's play with this for a day or two
    ghost_text = true
  }
}
