return {
	'nvimdev/lspsaga.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- optional
    'nvim-tree/nvim-web-devicons',     -- optional
  },
	config = function()
		local status, lspsaga = pcall(require, "lspsaga")
		if not status then
			print("Lspsaga not found")
			return
		end

		lspsaga.setup({})
	end,
}
