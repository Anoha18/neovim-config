return {
	"marko-cerovac/material.nvim",
  enabled = false,
	config = function()
		local status, material = pcall(require, "material")
		if not status then
			print("Material theme not found")
			return
		end

		material.setup({
			plugins = {
				"telescope",
				"nvim-web-devicons",
				-- "nvim-tree",
				-- "lspsaga",
				-- "indent-blankline",
				-- "gitsigns",
				"nvim-cmp",
			},
			disable = {
				background = true,
			},
		})

		vim.cmd("colorscheme material")
	end,
}
