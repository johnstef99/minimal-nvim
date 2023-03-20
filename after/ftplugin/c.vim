lua require('dap.ext.vscode').load_launchjs(nil, { lldb = {'c'} })
nnoremap <localleader>b :DapToggleBreakpoint<cr>
nnoremap <localleader>r :DapToggleRepl<cr>
nnoremap <localleader>c :DapContinue<cr>
nnoremap <localleader>i :DapStepInto<cr>
nnoremap <localleader>o :DapStepOut<cr>
nnoremap <localleader>v :DapStepOver<cr>
nnoremap <localleader>s <cmd>lua require('dap.ui.widgets').centered_float(require('dap.ui.widgets').scopes)<cr>
set cc=80
set norelativenumber
autocmd BufWritePre *.c silent! :g/^#pragma/norm ==
