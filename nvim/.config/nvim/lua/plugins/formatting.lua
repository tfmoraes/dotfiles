require("conform").setup({
  formatters = {
    ruff_isort = {
      command = "ruff",
      args = {
        "check",
        "--fix",
        "--select",
        "I",
        "--stdin-filename",
        "$FILENAME",
        "-",
      },
      stdin = true,
    },
  },
})

vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_fallback = true, range = range })
end, { range = true })

return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "ruff_isort", "ruff_format" },
        -- Use a sub-list to run only the first available formatter
        javascript = { { "prettierd", "prettier" } },
        markdown = { { "prettier" } },
        toml = { "taplo" },
        typst = { "typstfmt" },
        css = { "pretter" },
        scss = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        html = { "prettier" },
        cmake = { "cmake_format" },
        rust = { "rustfmt" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
        bash = { "beautysh" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        -- glsl = { "prettier" },
      },
    },
  },
}
