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
			autotag = {
				enable = true,
			},
			context_commentstring = {
				enable = true,
			},
		})
	end,
}
