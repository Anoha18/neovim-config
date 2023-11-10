return {
	"sindrets/diffview.nvim",
	config = function()
		local status, diffview = pcall(require, "diffview")
		if not status then
			print("Diffview not found")
			return
		end

		diffview.setup({})
	end,
}
