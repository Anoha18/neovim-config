return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local status, alpha = pcall(require, "alpha")
		if not status then
			print("Alpha not found")
		end

		local dashboard = require("alpha.themes.dashboard")

		alpha.setup(dashboard.config)

		vim.api.nvim_create_augroup("alpha_tabline", { clear = true })

		vim.api.nvim_create_autocmd("FileType", {
			group = "alpha_tabline",
			pattern = "alpha",
			command = "set showtabline=0 laststatus=0 noruler",
		})

		vim.api.nvim_create_autocmd("FileType", {
			group = "alpha_tabline",
			pattern = "alpha",
			callback = function()
				vim.api.nvim_create_autocmd("BufUnload", {
					group = "alpha_tabline",
					buffer = 0,
					command = "set showtabline=2 ruler laststatus=3",
				})
			end,
		})

		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				vim.cmd("Alpha")
			end,
		})
	end,
}
