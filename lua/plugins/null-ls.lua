return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
  event = "VeryLazy",
	config = function()
		local status, null_ls = pcall(require, "null-ls")
		if not status then
			print("Null ls not found")
			return
		end

		local null_ls_utils = require("null-ls.utils")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		null_ls.setup({
			root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
			sources = {
				-- Formatting
        null_ls.builtins.formatting.prettierd,
				require("none-ls.formatting.eslint_d"),

				-- Diagnostics
				require("none-ls.diagnostics.eslint_d"),
        null_ls.builtins.diagnostics.codespell,


				-- Code Actions
				require("none-ls.code_actions.eslint_d"),

				-- Completions
        null_ls.builtins.completion.luasnip,
        null_ls.builtins.completion.nvim_snippets,
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
