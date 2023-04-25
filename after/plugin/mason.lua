local loaded_mason, mason = pcall(require, "mason")
local loaded_masonlsp, masonlsp = pcall(require, "mason-lspconfig")
local loaded_lsp, lsp = pcall(require, "lspconfig")

if not loaded_mason or not loaded_masonlsp or not loaded_lsp then
	return
end

local on_attach = require("lsp.on_attach")
local loaded, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if not loaded then
	return
end
local capabilities = cmp_lsp.default_capabilities()

mason.setup()
masonlsp.setup({
	ensure_installed = { "lua_ls", "vimls" },
})

capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		"documentation",
		"detail",
		"additionalTextEdits",
	},
}

---@diagnostic disable-next-line: unused-function, unused-local
local function languages() -- {{{
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
		init_options = {
			--{{{
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

	-- eslint {{{
	lsp.eslint.setup({
		on_attach = function(client, bufnr)
			on_attach(client, bufnr)
			client.server_capabilities.document_formatting = false
		end,
		capabilities = capabilities,
	})
	--}}}

	-- typescript {{{
	lsp.tsserver.setup({
		on_attach = function(client, bufnr)
			on_attach(client, bufnr)
			client.server_capabilities.document_formatting = false
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

	-- vim {{{
	lsp.vimls.setup({
		capabilities = capabilities,
	})
	--}}}

	-- lua {{{
	-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
	-- local sumneko_root_path = vim.fn.stdpath("data") .. "/lsp_servers/sumneko_lua/extension/server"
	-- local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

	-- local runtime_path = vim.split(package.path, ";")
	-- table.insert(runtime_path, "lua/?.lua")
	-- table.insert(runtime_path, "lua/?/init.lua")

	-- require("lspconfig").sumneko_lua.setup({
	--   on_attach = on_attach,
	--   cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
	--   settings = {
	--     Lua = {
	--       runtime = {
	--         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
	--         version = "LuaJIT",
	--         -- Setup your lua path
	--         path = runtime_path,
	--       },
	--       diagnostics = {
	--         -- Get the language server to recognize the `vim` global
	--         globals = { "vim" },
	--       },
	--       workspace = {
	--         -- Make the server aware of Neovim runtime files
	--         library = vim.api.nvim_get_runtime_file("", true),
	--       },
	--       -- Do not send telemetry data containing a randomized but unique identifier
	--       telemetry = {
	--         enable = false,
	--       },
	--     },
	--   },
	-- })
	lsp.lua_ls.setup({})
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
		init_options = {
			provideFormatter = false,
		},
		on_attach = function(client)
			client.server_capabilities.document_formatting = false
		end,
	})
	--}}}

	-- flutter {{{
	require("flutter-tools").setup({
		debugger = {
			-- enabled = true,
			-- run_via_dap = true,
		},
		fvm = true,
		closing_tags = {
			enabled = false,
		},
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

	-- php {{{
	lsp.psalm.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})

	lsp.phpactor.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
	--}}}

	-- python {{{
	lsp.pylsp.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
	--}}}

	-- latex {{{
	lsp.texlab.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
	--}}}

	-- go {{{
	lsp.gopls.setup({
		cmd = { vim.fn.stdpath("data") .. "/lsp_servers/go/gopls" },
		on_attach = on_attach,
		capabilities = capabilities,
	})
	--}}}

	-- yaml {{{
	lsp.yamlls.setup({
		on_attach = on_attach,
		filetypes = { "yaml", "yml" },
		capabilities = capabilities,
		settings = {
			yaml = {
				schemas = {
					["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose.yaml",
				},
			},
		},
	})
	--}}}

	-- c {{{
	lsp.clangd.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
	--}}}

	-- verilog {{{
	lsp.verible.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
	--}}}

	-- vuels {{{
	lsp.volar.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
	--}}}

	-- svelte {{{
	lsp.svelte.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
	--}}}
end ---}}}

local function mason_auto_lspconfig() -- {{{
	masonlsp.setup_handlers({
		function(server_name)
			require("lspconfig")[server_name].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
		end,
		["lua_ls"] = function()
			lsp.lua_ls.setup({
				settings = {
					Lua = {
						format = { enable = false },
					},
				},
			})
		end,
		["yamlls"] = function()
			lsp.yamlls.setup({
				settings = {
					yaml = {
						hover = true,
						completion = true,
						validate = true,
						format = {
							enable = true,
						},
						schemaStore = {
							enable = true,
							url = "https://www.schemastore.org/api/json/catalog.json",
						},
					},
				},
			})
		end,
	})
end -- }}}

local function manual_lsp_setup()-- {{{
	lsp.verible.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end-- }}}

mason_auto_lspconfig()
manual_lsp_setup()
