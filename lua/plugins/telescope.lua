return {
	"nvim-telescope/telescope.nvim",
  -- branch = "master",
	tag = "0.1.8",
	-- dependencies = {
	-- 	"nvim-telescope/telescope-file-browser.nvim",
	-- },
	config = function()
		local status, telescope = pcall(require, "telescope")
		if not status then
			print("Telescope not found")
			return
		end

		local status2, builtin = pcall(require, "telescope.builtin")
		if not status2 then
			print("Telescope builtin not found")
			return
		end

		local previewers = require("telescope.previewers")

		local fb_actions = require("telescope").extensions.file_browser.actions

		function telescope_buffer_dir()
			return vim.fn.expand("%:p:h")
		end

		telescope.setup({
			pickers = {
				find_files = {
					no_ignore = false,
					hidden = true,
				},
			},
			defaults = {
				file_ignore_patterns = {
					"*.svg",
					".svg",
					".git",
					"node_modules",
				},
				prompt_prefix = "   ",
				selection_caret = "  ",
				entry_prefix = "  ",
				initial_mode = "insert",
				selection_strategy = "reset",
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
						results_width = 0.8,
					},
					vertical = {
						mirror = false,
					},
					width = 0.87,
					height = 0.80,
					preview_cutoff = 120,
				},
				-- file_sorter = require("telescope.sorters").get_fuzzy_file,
				-- generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
				path_display = { "truncate" },
				winblend = 0,
				border = {},
				color_devicons = true,
				file_previewer = previewers.vim_buffer_cat.new,
				grep_previewer = previewers.vim_buffer_vimgrep.new,
				qflist_previewer = previewers.vim_buffer_qflist.new,
				-- Developer configurations: Not meant for general override
				buffer_previewer_maker = previewers.buffer_previewer_maker,
			},
			extensions = {
				file_browser = {
					path = "%:p:h",
					cwd = telescope_buffer_dir(),
					hijack_netrw = true,
					respect_git_ignore = false,
					hidden = true,
					grouped = true,
					previewer = false,
					theme = "dropdown",
					initial_mode = "normal",
					layout_config = {
						width = 0.8,
						height = 0.8,
					},
					mappings = {
						["i"] = {
							["<C-w>"] = function()
								vim.cmd("normal vbd")
							end,
						},
						["n"] = {
							["N"] = fb_actions.create,
							["/"] = function()
								vim.cmd("startinsert")
							end,
						},
					},
				},
			},
		})

		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }

		keymap.set("n", "ff", builtin.find_files, opts)
		keymap.set("n", "fg", builtin.live_grep, opts)
		keymap.set("n", "fb", builtin.buffers, opts)
		keymap.set("n", "fh", builtin.help_tags, opts)
		keymap.set("n", ";;", builtin.resume, opts)
		keymap.set("n", "fe", builtin.diagnostics, opts)
		keymap.set("n", "fs", telescope.extensions.file_browser.file_browser, opts)
		keymap.set("n", "gs", builtin.git_status, opts)
		keymap.set("n", "gC", builtin.git_commits, opts)
		keymap.set("n", "gb", builtin.git_branches, opts)
		keymap.set("n", "gr", builtin.lsp_references, opts)
		keymap.set("n", "gd", builtin.lsp_definitions, opts)

		telescope.load_extension("file_browser")
    -- telescope.load_extension("noice")
	end,
}
