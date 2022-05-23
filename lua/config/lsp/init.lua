local M = {}

local lsp = require("lspconfig")
local on_attach = require("config.lsp.on_attach")
local capabilities = require("config.cmp").capabilities
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		"documentation",
		"detail",
		"additionalTextEdits",
	},
}

local function languages()
	--
	-- general lsp {{{
	lsp.diagnosticls.setup({
		on_attach = on_attach,
		filetypes = {
			"javascript",
			"javascriptreact",
			"json",
			"typescript",
			"typescriptreact",
			"css",
			"less",
			"scss",
			"markdown",
			"pandoc",
			"html",
		},
		capabilities = capabilities,
		init_options = { --{{{
			linters = {
				eslint = {
					command = "eslint_d",
					rootPatterns = { ".git" },
					debounce = 100,
					args = { "--stdin", "--stdin-filename", "%filepath", "--format", "json" },
					sourceName = "eslint_d",
					parseJson = {
						errorsRoot = "[0].messages",
						line = "line",
						column = "column",
						endLine = "endLine",
						endColumn = "endColumn",
						message = "[eslint] ${message} [${ruleId}]",
						security = "severity",
					},
					securities = {
						[2] = "error",
						[1] = "warning",
					},
				},
			},
			filetypes = {
				javascript = "eslint",
				javascriptreact = "eslint",
				typescript = "eslint",
				typescriptreact = "eslint",
			},
			formatters = {
				eslint_d = {
					command = "eslint_d",
					args = { "--stdin", "--stdin-filename", "%filename", "--fix-to-stdout" },
					rootPatterns = { ".git" },
				},
				prettier = {
					command = "prettier",
					args = { "--stdin-filepath", "%filename" },
				},
			},
			formatFiletypes = {
				css = "prettier",
				javascript = "prettier",
				javascriptreact = "prettier",
				json = "prettier",
				scss = "prettier",
				less = "prettier",
				typescript = "eslint_d",
				typescriptreact = "eslint_d",
				markdown = "prettier",
				html = "prettier",
			},
		}, --}}}
	})
	--}}}

	-- typescript {{{
	lsp.tsserver.setup({
		on_attach = function(client, bufnr)
			on_attach(client, bufnr)
			client.resolved_capabilities.document_formatting = false
		end,
		capabilities = capabilities,
	})
	--}}}

	-- css {{{
	lsp.cssls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
	--}}}

	-- tailwindcss {{{
	lsp.tailwindcss.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
	--}}}

	-- vim {{{
	lsp.vimls.setup({
		capabilities = capabilities,
	})
	--}}}

	-- lua {{{
	local system_name
	if vim.fn.has("mac") == 1 then
		system_name = "macOS"
	elseif vim.fn.has("unix") == 1 then
		system_name = "Linux"
	elseif vim.fn.has("win32") == 1 then
		system_name = "Windows"
	else
		print("Unsupported system for sumneko")
	end

	-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
	local sumneko_root_path = vim.fn.stdpath("data") .. "/lsp_servers/sumneko_lua/extension/server"
	local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name .. "/lua-language-server"

	local runtime_path = vim.split(package.path, ";")
	table.insert(runtime_path, "lua/?.lua")
	table.insert(runtime_path, "lua/?/init.lua")

	require("lspconfig").sumneko_lua.setup({
		on_attach = on_attach,
		cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
					-- Setup your lua path
					path = runtime_path,
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim" },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				},
			},
		},
	})
	--}}}

	-- html {{{
	lsp.html.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		init_options = {
			provideFormatter = false,
		},
	})
	--}}}

	-- json {{{
	lsp.jsonls.setup({
		on_attach = function(client, bufnr)
			client.resolved_capabilities.document_formatting = false
		end,
		commands = {
			Format = {
				function()
					vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
				end,
			},
		},
	})
	--}}}

	-- flutter {{{
	require("flutter-tools").setup({
		lsp = {
			on_attach = on_attach,
			capabilities = capabilities,
		},
	}) -- use defaults
	--}}}

	-- c# {{{
	local pid = vim.fn.getpid()
	local omnisharp_bin = vim.fn.stdpath("data") .. "/lsp_servers/omnisharp/omnisharp/run"
	require("lspconfig").omnisharp.setup({
		cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
		on_attach = on_attach,
	})
	--}}}

	-- php# {{{
	lsp.psalm.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
	lsp.phpactor.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
	--}}}

	-- python# {{{
	lsp.pylsp.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
	--}}}

	-- latex# {{{
	lsp.texlab.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
	--}}}

	-- go# {{{
	lsp.gopls.setup({
		cmd = { vim.fn.stdpath("data") .. "/lsp_servers/go/gopls" },
		on_attach = on_attach,
		capabilities = capabilities,
	})
	--}}}
end

function M.init()
	languages()
end

return M
