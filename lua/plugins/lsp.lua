return {
	"neovim/nvim-lspconfig",
	config = function()
		local status, lspconfig = pcall(require, "lspconfig")
		if not status then
			print("Lspconfig not found")
			return
		end

		lspconfig.tsserver.setup({
			filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
			cmd = { "typescript-language-server.cmd", "--stdio" },
			root_dir = function()
				return vim.loop.cwd()
			end,
		})

		lspconfig.volar.setup({
			filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
			cmd = { "vue-language-server.cmd", "--stdio" },
			on_attach = function(client)
				client.resolved_capabilities.document_formatting = false
				client.resolved_capabilities.document_range_formatting = false
			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		lspconfig.cssls.setup({
			capabilities = capabilities,
			cmd = { "css-lsp.cmd", "--stdio" },
		})

		-- lspconfig.html.setup({
		--   cmd = { "html-lsp.cmd", "--stdio" },
		-- })

		lspconfig.lua_ls.setup({
			cmd = { "lua-language-server.cmd", "--stdio" },
		})

		lspconfig.docker_compose_language_service.setup({
			cmd = { "docker-compose-langserver.cmd", "--stdio" },
		})

		lspconfig.dockerls.setup({
			cmd = { "docker-langserver.cmd", "--stdio" },
		})

		lspconfig.tailwindcss.setup({
			cmd = { "tailwindcss-language-server.cmd", "--stdio" },
		})

		-- lspconfig.bashls.setup({
		--   cmd = { "bash-language-server.cmd", "start" },
		-- })
	end,
}
