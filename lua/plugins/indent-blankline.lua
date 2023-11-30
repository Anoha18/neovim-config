return {
	"lukas-reineke/indent-blankline.nvim",
	version = "2.20.8",
	-- main = "ibl",
	config = function()
		-- local status, ibl = pcall(require, "ibl")
		-- if not status then
		-- 	print("Indent blankline not found")
		-- 	return
		-- end

		-- local hooks = require("ibl.hooks")

		-- local highlight = {
		-- 	"RainbowViolet",
		-- }

		-- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
		-- 	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
		-- end)

		-- vim.g.rainbow_delimiters = { highlight = highlight }

		-- ibl.setup({
		-- 	whitespace = {
		-- 		highlight = highlight,
		-- 		remove_blankline_trail = false,
		-- 	},
		-- 	scope = {
		-- 		highlight = highlight,
		-- 		show_exact_scope = true,
		-- 		show_start = true,
		-- 		show_end = true,
		-- 	},
		-- })

		-- hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
		local status, indent_blankline = pcall(require, "indent_blankline")
		if not status then
			print("Indent blankline not found")
			return
		end

		indent_blankline.setup({
			show_current_context = true,
			show_current_context_start = true,
		})
	end,
}
