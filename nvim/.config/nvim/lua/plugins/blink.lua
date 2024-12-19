local has_words_before = function()
  if vim.api.nvim_get_option_value("buftype", { buf = 0 }) == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        list = {
          selection = "auto_insert",
        },
      },
      keymap = {
        preset = "enter",
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<Tab>"] = {
          function(cmp)
            if not has_words_before() then
              return
            end

            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_next()
            end
          end,
          "snippet_forward",
          "fallback",
        },
      },
    },
  },
}
