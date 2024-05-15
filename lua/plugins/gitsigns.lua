return {
	"lewis6991/gitsigns.nvim",
	event = { "User FileOpened", "BufReadPre", "BufNewFile" },
	cmd = "Gitsigns",
	config = function()
		local status, gitsigns = pcall(require, "gitsigns")
		if not status then
			print("Gitsigns not found")
			return
		end

		gitsigns.setup({
			signs = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
			},
      current_line_blame_formatter = '<abbrev_sha>: <author>, <author_time:%Y-%m-%d> - <summary>',
			current_line_blame = true,
			signcolumn = true,
      numhl = true,
			watch_gitdir = {
				interval = 1000,
				follow_files = true,
			},
		})

    require("scrollbar.handlers.gitsigns").setup()
	end,
}
