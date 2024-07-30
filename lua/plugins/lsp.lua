return {
	"neovim/nvim-lspconfig",
	config = function()
		local status, lspconfig = pcall(require, "lspconfig")
		if not status then
			print("Lspconfig not found")
			return
		end

    local cmpCapabilities = require("cmp_nvim_lsp").default_capabilities()

		lspconfig.tsserver.setup({
      capabilities = cmpCapabilities,

			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
				"vue",
			},
			init_options = {
				plugins = {
					{
						name = "@vue/typescript-plugin",
						location = "C:/Users/anoha/AppData/Roaming/npm/node_modules/@vue/typescript-plugin",
						languages = { "javascript", "typescript", "vue" },
					},
				},
			},
			cmd = { "typescript-language-server.cmd", "--stdio" },
			-- root_dir = function()
			-- 	return vim.loop.cwd()
			-- end,
		})

		lspconfig.volar.setup({
			filetypes = { "vue" },
			cmd = { "vue-language-server.cmd", "--stdio" },
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		lspconfig.cssls.setup({
			capabilities = capabilities,
			cmd = { "vscode-css-language-server.cmd", "--stdio" },
		})

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

		lspconfig.bashls.setup({
			cmd = { "bash-language-server.cmd", "--stdio" },
		})
	end,
}
