return {
	"neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    "williamboman/mason.nvim"
  },
	config = function()
		local status, lspconfig = pcall(require, "lspconfig")
		if not status then
			print("Lspconfig not found")
			return
		end

		-- local capabilities = vim.lsp.protocol.make_client_capabilities()
		-- capabilities.textDocument.completion.completionItem.snippetSupport = true

    -- local cmpCapabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
    local cmpCapabilities = vim.tbl_deep_extend("force",
    vim.lsp.protocol.make_client_capabilities(),
      require('cmp_nvim_lsp').default_capabilities()
    )
    cmpCapabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false
    -- local cmpCapabilities = require("cmp_nvim_lsp").default_capabilities()
    local util = require("lspconfig.util")

    vim.lsp.config('ts_ls', {
      -- capabilities = cmpCapabilities,
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
            location = vim.env.MASON .. "/packages/vue-language-server/node_modules/@vue/language-server",
						languages = { "vue" },
					},
				},
			},
      settings = {
        -- TODO: Работает медленно и неудобно, вернуть как ипсправят
        -- typescript = {
          -- tsserver = {
          --   useSyntaxServer = false,
          -- },
          -- inlayHints = {
          --   includeInlayParameterNameHints = 'all',
          --   includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          --   includeInlayFunctionParameterTypeHints = true,
          --   includeInlayVariableTypeHints = true,
          --   includeInlayVariableTypeHintsWhenTypeMatchesName = true,
          --   includeInlayPropertyDeclarationTypeHints = true,
          --   includeInlayFunctionLikeReturnTypeHints = true,
          --   includeInlayEnumMemberValueHints = true,
          -- },
        -- },
      },
			cmd = { "typescript-language-server.cmd", "--stdio" },
    })


    vim.lsp.config('vue_ls', {
      -- capabilities = cmpCapabilities,
      filetypes = {
        'vue',
      },
			cmd = { "vue-language-server.cmd", "--stdio" },
      -- TODO: Не работает с hybridMode=false
      -- settings = {
      --   typescript = {
      --     inlayHints = {
      --       enumMemberValues = {
      --         enabled = true,
      --       },
      --       functionLikeReturnTypes = {
      --         enabled = true,
      --       },
      --       propertyDeclarationTypes = {
      --         enabled = true,
      --       },
      --       parameterTypes = {
      --         enabled = true,
      --         suppressWhenArgumentMatchesName = true,
      --       },
      --       variableTypes = {
      --         enabled = true,
      --       },
      --     },
      --   },
      -- },
    })

    vim.lsp.config('cssls', {
      -- capabilities = cmpCapabilities,
			cmd = { "vscode-css-language-server.cmd", "--stdio" },
    })

    vim.lsp.config('lua_ls', {
      -- capabilities = cmpCapabilities,
			cmd = { "lua-language-server.cmd", "--stdio" },
    })

		vim.lsp.config('docker_compose_language_service', {
      -- capabilities = cmpCapabilities,
			cmd = { "docker-compose-langserver.cmd", "--stdio" },
		})

		vim.lsp.config('dockerls', {
      -- capabilities = cmpCapabilities,
			cmd = { "docker-langserver.cmd", "--stdio" },
		})

		vim.lsp.config('tailwindcss', {
      -- capabilities = cmpCapabilities,
			cmd = { "tailwindcss-language-server.cmd", "--stdio" },
		})

		vim.lsp.config('bashls', {
      -- capabilities = cmpCapabilities,
			cmd = { "bash-language-server.cmd" },
		})

    vim.lsp.config('html', {
      cmd = { "vscode-html-language-server.cmd", "--stdio" },
      -- capabilities = cmpCapabilities,
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

    local angularls_path = vim.env.MASON .. '/packages/angular-language-server'
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

    vim.lsp.config('angularls', {
      -- capabilities = cmpCapabilities,
      cmd = angular_cmd,
      on_new_config = function(new_config)
        new_config.cmd = angular_cmd
      end,
    })

    vim.lsp.config('svelte', {
      -- capabilities = cmpCapabilities,
      cmd = { "svelteserver.cmd", "--stdio" }
    })

    vim.lsp.enable('ts_ls')
    vim.lsp.enable('vue_ls')
    vim.lsp.enable('cssls')
    vim.lsp.enable('lua_ls')
    vim.lsp.enable('docker_compose_language_service')
    vim.lsp.enable('dockerls')
    vim.lsp.enable('tailwindcss')
    vim.lsp.enable('bashls')
    vim.lsp.enable('html')
    vim.lsp.enable('angularls')
    vim.lsp.enable('svelte')
	end,
}
