return {
	"nvim-tree/nvim-web-devicons",
	config = function()
		local status, icons = pcall(require, "nvim-web-devicons")
		if not status then
			print("Devicons not found")
			return
		end

		icons.setup({
			default = true,
			color_icons = true,
		})
	end,
}
