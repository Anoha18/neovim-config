return {
	"nvimtools/none-ls.nvim",
	-- "jose-elias-alvarez/null-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local status, null_ls = pcall(require, "null-ls")
		if not status then
			print("Null ls not found")
			return
		end

		local null_ls_utils = require("null-ls.utils")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		local fmt = null_ls.builtins.formatting
		-- local dgn = null_ls.builtins.diagnostics
		-- local cda = null_ls.builtins.code_actions
		local cmp = null_ls.builtins.completion

		null_ls.setup({
			root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
			sources = {
				-- Formatting
				-- fmt.eslint_d,
				-- fmt.stylua,
				require("none-ls.formatting.eslint_d"),

				-- Diagnostics
				require("none-ls.diagnostics.eslint_d"),
				-- Code Actions
				require("none-ls.code_actions.eslint_d"),
				-- cda.eslint_d,

				-- Completions
				-- cmp.luasnip,
			},
			-- debug = true,
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								bufnr = bufnr,
								filter = function(client)
									return client.name == "null-ls"
								end,
							})
						end,
					})
				end
			end,
		})
	end,
}
