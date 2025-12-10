return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local status, lualine = pcall(require, "lualine")
		if not status then
			print("Lualine not found")
			return
		end

		lualine.setup({
      options = {
        theme = 'tomorrow_night',
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        globalstatus = true,
      },
      sections = {
        lualine_a = { { 'mode', fmt = function(str) return str:sub(1,1) end } },
        lualine_b = { { 'branch', fmt = function(s) return s:sub(1,20) end }, 'diff' },
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { { 'diagnostics' }, 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
		})
	end,
}
