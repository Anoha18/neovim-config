return {
	"kylechui/nvim-surround",
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	event = "VeryLazy",
	config = function()
		local status, surround = pcall(require, "nvim-surround")
		if not status then
			print("Not found nvim surround")
			return
		end

		surround.setup({})
	end,
}
