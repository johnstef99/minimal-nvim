" Telescope {{{
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>d <cmd>Telescope diagnostics<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>td <cmd>Telescope diagnostics bufnr=0<cr>
nnoremap <leader>tg <cmd>Telescope live_grep<cr>
nnoremap <leader>th <cmd>Telescope help_tags<cr>
nnoremap <leader>tt <cmd>Telescope builtin<cr>
" }}}

" Nerdtree {{{
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
nnoremap <leader>e :NERDTreeToggle<CR>
let g:NERDTreeGitStatusUseNerdFonts = 1
let NERDTreeIgnore=['\~$', '\.aux$', '\.log$', '\.out$', '\.fls$']
" }}}

" Sneak {{{
let g:sneak#label = 1
" }}}

" Lua settings {{{
lua require("config")
"}}}

" Barbar maps {{{
" nnoremap <silent> <leader>bb :BufferPick<CR>
" nnoremap <silent> gt :BufferNext<CR>
" nnoremap <silent> gT :BufferPrevious<CR>
" nnoremap <silent> <leader>bc :BufferClose<CR>
" nnoremap <silent> <leader>bw :BufferWipeout<CR>
" nnoremap <silent> <leader>bo :BufferCloseAllButCurrent<CR>
"}}}

" Utilsnips {{{
let g:UltiSnipsExpandTrigger = '<F1>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
" }}}
