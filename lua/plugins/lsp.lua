return {
	"neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim"
  },
	config = function()
		local status, lspconfig = pcall(require, "lspconfig")
		if not status then
			print("Lspconfig not found")
			return
		end

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true

    local cmpCapabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
    local mason_registry = require('mason-registry')
    local util = require("lspconfig.util")

    local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server'

		lspconfig.ts_ls.setup({
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
            location = vue_language_server_path,
						languages = { "vue" },
					},
				},
			},
			cmd = { "typescript-language-server.cmd", "--stdio" },
      root_dir = util.root_pattern(
        'package.json'
      ),
		})

		lspconfig.volar.setup({
      capabilities = cmpCapabilities,
      filetypes = {
        'vue',
      },
      root_dir = util.root_pattern(
        'package.json'
      ),
			cmd = { "vue-language-server.cmd", "--stdio" },
		})

		lspconfig.cssls.setup({
      capabilities = cmpCapabilities,
			cmd = { "vscode-css-language-server.cmd", "--stdio" },
		})

		lspconfig.lua_ls.setup({
      capabilities = cmpCapabilities,
			cmd = { "lua-language-server.cmd", "--stdio" },
		})

		lspconfig.docker_compose_language_service.setup({
      capabilities = cmpCapabilities,
			cmd = { "docker-compose-langserver.cmd", "--stdio" },
		})

		lspconfig.dockerls.setup({
      capabilities = cmpCapabilities,
			cmd = { "docker-langserver.cmd", "--stdio" },
		})

		lspconfig.tailwindcss.setup({
      capabilities = cmpCapabilities,
			cmd = { "tailwindcss-language-server.cmd", "--stdio" },
		})

		lspconfig.bashls.setup({
      capabilities = cmpCapabilities,
			cmd = { "bash-language-server.cmd" },
		})

    lspconfig.html.setup({
      cmd = { "vscode-html-language-server.cmd", "--stdio" },
      capabilities = cmpCapabilities,
      filetypes = {
        'django-html',
        'ejs',
        'handlebars',
        'hbs',
        'html',
        'htmldjango',
        'pug',
        'templ',
        'template',
      },
    })

    local angularls_path = mason_registry.get_package('angular-language-server'):get_install_path()
    local angular_cmd = {
      'ngserver.cmd',
      '--stdio',
      '--tsProbeLocations',
      table.concat({
        angularls_path,
        vim.uv.cwd(),
      }, ','),
      '--ngProbeLocations',
      table.concat({
        angularls_path .. '/node_modules/@angular/language-server',
        vim.uv.cwd(),
      }, ','),
    }

    lspconfig.angularls.setup{
      capabilities = cmpCapabilities,
      cmd = angular_cmd,
      on_new_config = function(new_config)
        new_config.cmd = angular_cmd
      end,
    }
	end,
}
