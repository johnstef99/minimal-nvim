local loaded, whichKey = pcall(require, "which-key")
if not loaded then
	return
end

vim.o.timeout = true
vim.o.timeoutlen = 500
whichKey.setup()
