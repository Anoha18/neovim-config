return {
	"akinsho/nvim-bufferline.lua",
	version = "*",
  event = "VeryLazy",
	config = function()
		local status, bufferline = pcall(require, "bufferline")
		if not status then
			print("Bufferline not found")
			return
		end

		bufferline.setup({
			options = {
				mode = "tabs",
				always_show_bufferline = false,
				show_buffer_close_icons = false,
				show_close_icon = false,
				color_icons = true,
				diagnostics = "nvim_lsp",
			},
			highlights = {
				buffer_selected = {
					italic = true,
					bold = true,
				},
			},
		})
	end,
}
