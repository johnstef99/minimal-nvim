" Telescope {{{
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope git_files<cr>
nnoremap <leader>dd <cmd>Telescope diagnostics<cr>
nnoremap <leader>bf <cmd>Telescope buffers<cr>
nnoremap <leader>td <cmd>Telescope diagnostics bufnr=0<cr>
nnoremap <leader>tg <cmd>Telescope live_grep<cr>
nnoremap <leader>th <cmd>Telescope help_tags<cr>
nnoremap <leader>tt <cmd>Telescope builtin<cr>
" }}}

" Sneak {{{
function! ReturnHighlightTerm(group, term)
   " Store output of group to variable
   let output = execute('hi ' . a:group)

   " Find the term we're looking for
   return matchstr(output, a:term.'=\zs\S*')

endfunction
let g:sneak#label = 1
map s <Plug>Sneak_s
let bg = ReturnHighlightTerm('IncSearch', 'guibg')
let fg = ReturnHighlightTerm('IncSearch', 'guifg')
exec 'hi SneakLabel guibg='.bg.' guifg='.fg
exec 'hi SneakLabelMask guibg='.bg.' guifg=None'

" }}}

" Fugitive {{{
nnoremap ]c :GitGutterNextHunk<CR>zz
nnoremap [c :GitGutterPrevHunk<CR>zz
nnoremap <leader>dg :diffget<CR>
nnoremap <leader>dp :diffput<CR>
vnoremap <leader>dg :diffget<CR>
vnoremap <leader>dp :diffput<CR>
" }}}

" Vimtex {{{
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
" }}}
