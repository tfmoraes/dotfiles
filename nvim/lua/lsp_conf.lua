local nvim_lsp = require('lspconfig')

local on_attach = function(_, bufnr)
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	-- require'diagnostic'.on_attach()
	-- require'completion'.on_attach()
	local opts = { noremap=true, silent=true }
	require'lsp_signature'.on_attach()
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>', opts)
end


vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
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
		update_in_insert = false,
	}
	)

local servers = {'gopls', 'rust_analyzer', 'tsserver', 'vimls', 'pyright', 'jsonls', 'clangd'}
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup {
		on_attach = on_attach,
	}
end

nvim_lsp['sumneko_lua'].setup {
    on_attach = on_attach,
    cmd = {"lua-lsp", },
}
