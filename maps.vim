nnoremap Y yg$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nmap <leader>se :setlocal spell spelllang=el2,en<CR>
nmap <leader>sn :setlocal nospell<CR>
inoremap <c-l> <c-^>
inoremap <c-f> <c-g>u<Esc>[s1z=`]a<c-g>u
nmap <c-b>o :BufOnly<CR>
nmap <leader>z :Goyo<CR>

" exit terminal mode
tnoremap <A-Esc> <C-\><C-n> 

" resize windows
nmap <M-l> <C-W><
nmap <M-h> <C-W>>
nmap <M-j> <C-W>+
nmap <M-k> <C-W>-

" zen mode
nnoremap <leader>\ :ZenMode<CR>
