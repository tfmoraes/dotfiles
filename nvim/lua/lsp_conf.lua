local nvim_lsp = require("lspconfig")

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	-- require'diagnostic'.on_attach()
	-- require'completion'.on_attach()
	local cfg = {
		bind = true, -- This is mandatory, otherwise border config won't get registered.
		-- If you want to hook lspsaga or other signature handler, pls set to false
		doc_lines = 0, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
		-- set to 0 if you DO NOT want any API comments be shown
		-- This setting only take effect in insert mode, it does not affect signature help in normal
		-- mode

		floating_window = false, -- show hint in a floating window, set to false for virtual text only mode
		hint_enable = false, -- virtual hint enable
		hint_prefix = "", -- Panda for parameter
		hint_scheme = "String",
		handler_opts = {
			border = "none", -- double, single, shadow, none
		},
	}
	require("lsp_signature").on_attach(cfg)
	require("lsp-status").on_attach(client)
	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

--[[ vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    -- This will disable virtual text, like doing:
    -- let g:diagnostic_enable_virtual_text = 0
    virtual_text = false,
    -- This is similar to:
    -- let g:diagnostic_show_sign = 1
    -- To configure sign display,
    --  see: ":help vim.lsp.diagnostic.set_signs()"
    signs = true,
    -- This is similar to:
    -- "let g:diagnostic_insert_delay = 1"
    update_in_insert = false
  }
) ]]
vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	update_in_insert = false,
})

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = {
	"gopls",
	"rust_analyzer",
	"tsserver",
	"vimls",
	"ruff_lsp",
	"jsonls",
	"clangd",
	"angularls",
	"texlab",
	"dockerls",
	"marksman",
	"cmake",
}
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 500,
		},
	})
end

--[[ nvim_lsp["sumneko_lua"].setup {
  on_attach = on_attach,
  cmd = {"lua-lsp"}
} ]]

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

--[[ nvim_lsp["sumneko_lua"].setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
} ]]

require("lspconfig").pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 500,
	},
	before_init = function(_, config)
		config.settings.python.analysis.stubPath = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy", "python-type-stubs")
	end,
})

require("lspconfig").lua_ls.setup({
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})
