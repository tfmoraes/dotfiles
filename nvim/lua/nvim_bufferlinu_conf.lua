if not pcall(require, 'vimp') then
   vim.cmd [[ echom 'Cannot load `vimpp`' ]]
   return
end

require'bufferline'.setup{
	options = {
		mappings = true,
	}
}

-- Magic buffer-picking mode
vimp.nnoremap({'silent'}, '<Leader>s', [[ :BufferLinePick<CR> ]])
-- Sort automatically by...
vimp.nnoremap({'silent'}, '<Space>bd', [[ :BufferOrderByDirectory<CR> ]])
vimp.nnoremap({'silent'}, '<Space>bl', [[ :BufferOrderByLanguage<CR> ]])
-- Move to previous/next            
vimp.nnoremap({'silent'}, '<leader>,', [[:BufferLineCycleNext <CR>]])
vimp.nnoremap({'silent'}, '<leader>.', [[:BufferLineCyclePrev <CR>]])
-- Re-order to previous/next        
vimp.nnoremap({'silent'}, '<leader><', [[ :BufferLineMovePrev<CR> ]])
vimp.nnoremap({'silent'}, '<leader>>', [[ :BufferLineMoveNext<CR> ]])
-- Goto buffer in position...
--vimp.nnoremap({'silent'}, '<leader>1', go_to_buffer(1))
--vimp.nnoremap({'silent'}, '<leader>2', go_to_buffer(2))
--vimp.nnoremap({'silent'}, '<leader>3', go_to_buffer(3))
--vimp.nnoremap({'silent'}, '<leader>4', go_to_buffer(4))
--vimp.nnoremap({'silent'}, '<leader>5', go_to_buffer(5))
--vimp.nnoremap({'silent'}, '<leader>6', go_to_buffer(6))
--vimp.nnoremap({'silent'}, '<leader>7', go_to_buffer(7))
--vimp.nnoremap({'silent'}, '<leader>8', go_to_buffer(8))
--vimp.nnoremap({'silent'}, '<leader>9', go_to_buffer(9))
-- Close buffer                    
vimp.nnoremap({'silent'}, '<leader>c', [[ :BufferClose<CR> ]])

