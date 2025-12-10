return {
	"neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    "williamboman/mason.nvim"
  },
	config = function()
		local status = pcall(require, "lspconfig")
		if not status then
			print("Lspconfig not found")
			return
		end

		-- local capabilities = vim.lsp.protocol.make_client_capabilities()
		-- capabilities.textDocument.completion.completionItem.snippetSupport = true

    -- local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    -- Удалил ts_ls так как есть лучшая поддержка typescript через vtsls, которая хорошо работает вместе с vue-language-server
    -- vim.lsp.config('ts_ls', {
    --   capabilities = capabilities,
			-- filetypes = {
				-- "javascript",
				-- "javascriptreact",
				-- "javascript.jsx",
				-- "typescript",
				-- "typescriptreact",
				-- "typescript.tsx",
			-- },
    --   settings = {
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
      -- },
			-- cmd = { "typescript-language-server", "--stdio" },
    -- })

    local vue_language_server_path = vim.fn.expand '$MASON/packages' .. '/vue-language-server' .. '/node_modules/@vue/language-server'
    local vue_plugin = {
      name = '@vue/typescript-plugin',
      location = vue_language_server_path,
      languages = { 'vue' },
      configNamespace = 'typescript',
    }

    vim.lsp.config('vtsls', {
      settings = {
        vtsls = {
          tsserver = {
            globalPlugins = {
              vue_plugin,
            },
          },
          enableMoveToFileCodeAction = true,
        },
        typescript = {
          inlayHints = {
            parameterNames = { enabled = "all" },      -- "none" | "literals" | "all"
            parameterTypes = { enabled = true },
            variableTypes = { enabled = true },
            propertyDeclarationTypes = { enabled = true },
            functionLikeReturnTypes = { enabled = true },
            enumMemberValues = { enabled = true },
          },
        },
      },
      javascript = {
        inlayHints = {
          parameterNames = { enabled = "all" },
          parameterTypes = { enabled = true },
          variableTypes = { enabled = true },
          propertyDeclarationTypes = { enabled = true },
          functionLikeReturnTypes = { enabled = true },
          enumMemberValues = { enabled = true },
        },
      },
      filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    })

    vim.lsp.config('vue_ls', {
      filetypes = { 'vue' },
      capabilities = capabilities,
      on_init = function(client)
        client.handlers['tsserver/request'] = function(_, result, context)
          local clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = 'vtsls' })
          if #clients == 0 then
            vim.notify('Could not find `vtsls` lsp client, `vue_ls` would not work without it.', vim.log.levels.ERROR)
            return
          end
          local ts_client = clients[1]

          local param = unpack(result)
          local id, command, payload = unpack(param)
          ts_client:exec_cmd({
            title = 'vue_request_forward', -- You can give title anything as it's used to represent a command in the UI, `:h Client:exec_cmd`
            command = 'typescript.tsserverRequest',
            arguments = {
              command,
              payload,
            },
          }, { bufnr = context.bufnr }, function(_, r)
              local response_data = { { id, r.body } }
              ---@diagnostic disable-next-line: param-type-mismatch
              client:notify('tsserver/response', response_data)
            end)
        end
      end,
      settings = {
        vue = {
          inlayHints = {
            destructuredProps = { enabled = true },
            inlineHandlerLoading = { enabled = true },
            missingProps = { enabled = true },
            optionsWrapper = { enabled = true },
            vBindShorthand = { enabled = true },
          },
        },
      }
    })

    vim.lsp.config('cssls', {
      capabilities = capabilities,
    })

    vim.lsp.config('lua_ls', {
      capabilities = capabilities,
    })

		vim.lsp.config('docker_compose_language_service', {
      capabilities = capabilities,
		})

		vim.lsp.config('dockerls', {
      capabilities = capabilities,
		})

		vim.lsp.config('tailwindcss', {
      capabilities = capabilities,
		})

		vim.lsp.config('bashls', {
      capabilities = capabilities,
		})

    vim.lsp.config('html', {
      capabilities = capabilities,
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

    local angularls_path = vim.fn.expand '$MASON/packages' .. '/angular-language-server'
    local angular_cmd = {
      'ngserver',
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
      capabilities = capabilities,
      cmd = angular_cmd,
      on_new_config = function(new_config)
        new_config.cmd = angular_cmd
      end,
    })

    vim.lsp.config('svelte', {
      capabilities = capabilities,
    })

    vim.lsp.config('pyright', {
      capabilities = capabilities,
    })

    -- vim.lsp.enable('ts_ls')
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
    vim.lsp.enable('pyright')

    vim.lsp.inlay_hint.enable()
	end,
}
