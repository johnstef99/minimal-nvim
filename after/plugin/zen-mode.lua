local loaded, zenMode = pcall(require, "zen-mode")
if not loaded then
	return
end

zenMode.setup({
	plugins = {
		tmux = { enabled = true },
	},
})
