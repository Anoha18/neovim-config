return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
  lazy = false,
	config = function()
		local status, treesitter_configs = pcall(require, "nvim-treesitter.configs")
		if not status then
			print("Treesitter not found")
			return
		end

		require("ts_context_commentstring").setup({})

		treesitter_configs.setup({
			ensure_installed = {
				"tsx",
				"php",
				"python",
				"lua",
				"json",
				"css",
				"scss",
				"vue",
				"html",
				"query",
				"vim",
				"javascript",
				"typescript",
				"comment",
				"regex",
				"markdown",
				"bash",
			},

			matchup = {
				-- enables vim-matchup integration
				enable = true,
				enable_quotes = true,
			},

			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
				disable = {},
			},
		})

		vim.g.skip_ts_context_commentstring_module = true
	end,
}
