function! ReturnHighlightTerm(group, term)
   " Store output of group to variable
   let output = execute('hi ' . a:group)

   " Find the term we're looking for
   return matchstr(output, a:term.'=\zs\S*')
endfunction

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

" Nerdtree {{{
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
nnoremap <leader>e :NERDTreeToggle<CR>
let g:NERDTreeGitStatusUseNerdFonts = 1
let NERDTreeIgnore=['\~$', '\.aux$', '\.log$', '\.out$', '\.fls$', '\.g.dart$', '\.freezed.dart$']
" }}}

" Sneak {{{
let g:sneak#label = 1
map s <Plug>Sneak_s
let bg = ReturnHighlightTerm('Search', 'guibg')
let fg = ReturnHighlightTerm('Search', 'guifg')
exec 'hi SneakLabel guibg='.bg.' guifg='.fg
exec 'hi SneakLabelMask guibg='.bg.' guifg=None'

" }}}

" Lua settings {{{
lua require("config")
"}}}

" Barbar maps {{{
nnoremap <silent> <leader>bb :BufferPick<CR>
" nnoremap <silent> gt :BufferNext<CR>
" nnoremap <silent> gT :BufferPrevious<CR>
nnoremap <silent> <leader>bc :BufferClose<CR>
nnoremap <silent> <leader>bw :BufferWipeout<CR>
nnoremap <silent> <leader>bo :BufferCloseAllButCurrent<CR>
"}}}

" Utilsnips {{{
let g:UltiSnipsExpandTrigger = '<F1>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
" }}}

" Goyo {{{
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
" }}}

" Fugitive {{{
nnoremap ]c :GitGutterNextHunk<CR>zz
nnoremap [c :GitGutterPrevHunk<CR>zz
nnoremap <leader>dg :diffget<CR>
nnoremap <leader>dp :diffput<CR>
vnoremap <leader>dg :diffget<CR>
vnoremap <leader>dp :diffput<CR>
" }}}
