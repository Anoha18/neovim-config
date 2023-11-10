return {
	"jose-elias-alvarez/null-ls.nvim",
	config = function()
		local status, null_ls = pcall(require, "null-ls")
		if not status then
			print("Null ls not found")
			return
		end

		local null_ls_utils = require("null-ls.utils")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		local fmt = null_ls.builtins.formatting
		local dgn = null_ls.builtins.diagnostics
		local cda = null_ls.builtins.code_actions
		local cmp = null_ls.builtins.completion

		null_ls.setup({
			-- root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
			sources = {

				-- Formatting
				-- fmt.prettierd,
				fmt.eslint_d,
				-- fmt.prettier.with({
				--   filetypes = { "html", "json", "yaml", "markdown", "javascript", "typescript" },
				-- }),
				fmt.stylua,

				-- Diagnostics
				dgn.eslint_d,
				-- dgn.shellcheck,
				-- dgn.pylint.with({
				--   method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
				-- }),

				-- Code Actions
				cda.eslint_d,
				-- cda.shellcheck,

				-- Completions
				cmp.luasnip,
			},
			debug = true,
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
