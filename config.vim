" Telescope {{{
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>tg <cmd>Telescope live_grep<cr>
nnoremap <leader>tb <cmd>Telescope buffers<cr>
nnoremap <leader>th <cmd>Telescope help_tags<cr>
nnoremap <leader>tdw <cmd>Telescope lsp_workspace_diagnostics<cr>
nnoremap <leader>tdd <cmd>Telescope lsp_document_diagnostics<cr>
nnoremap <leader>tsw <cmd>Telescope lsp_workspace_symbols<cr>
nnoremap <leader>tsd <cmd>Telescope lsp_document_symbols<cr>
" }}}

" Nerdtree {{{
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
nnoremap <leader>e :NERDTreeToggle<CR>
let g:NERDTreeGitStatusUseNerdFonts = 1
" }}}

" Sneak {{{
let g:sneak#label = 1
" }}}

" Lua settings {{{
lua require("config")
"}}}

" Barbar maps {{{
nnoremap <silent> <leader>bb :BufferPick<CR>
nnoremap <silent> gt :BufferNext<CR>
nnoremap <silent> gT :BufferPrevious<CR>
nnoremap <silent> <leader>bc :BufferClose<CR>
nnoremap <silent> <leader>bw :BufferWipeout<CR>
nnoremap <silent> <leader>bo :BufferCloseAllButCurrent<CR>
"}}}

" Emmet {{{
if(has("mac"))
  let g:user_emmet_leader_key = '§'
  let g:user_emmet_expandabbr_key = '§§'
else
  let g:user_emmet_leader_key = '`'
  let g:user_emmet_expandabbr_key = '``'
endif
" }}}
