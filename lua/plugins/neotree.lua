return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local status, neotree = pcall(require, "neo-tree")
		if not status then
			print("Neo tree not found")
			return
		end

		vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
		vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
		vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
		vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

		neotree.setup({
			close_if_last_window = true,
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_diagnostics = true,
			default_component_configs = {
				container = {
					enable_character_fade = true,
				},
				indent = {
					indent_size = 2,
					padding = 1,
					with_markers = true,
					-- indent_marker = '|',
					-- last_indent_marker = "└",
					highlight = "NeoTreeIndentMarker",
					with_expanders = false, -- if nil and file nesting is enabled, will enable expanders
					-- expander_collapsed = "",
					-- expander_expanded = "",
					-- expander_highlight = "NeoTreeExpander",
				},
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "ﰊ",
					-- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
					-- then these will never be used.
					-- default = "*",
					highlight = "NeoTreeFileIcon",
				},
				modified = {
					symbol = "[+]",
					highlight = "NeoTreeModified",
				},
				name = {
					trailing_slash = false,
					highlight_opened_files = true,
					use_git_status_colors = true,
					highlight = "NeoTreeFileName",
				},
				git_status = {
					symbols = {
						-- Change type
						added = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
						modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
						deleted = "✖", -- this can only be used in the git_status source
						renamed = "󰑕", -- this can only be used in the git_status source
						-- Status type
						untracked = "",
						ignored = "",
						unstaged = "",
						staged = "",
						conflict = "",
					},
				},
				diagnostics = {
					symbols = {
						hint = "",
						info = "",
						warn = "",
						error = "",
					},
					highlights = {
						hint = "DiagnosticSignHint",
						info = "DiagnosticSignInfo",
						warn = "DiagnosticSignWarn",
						error = "DiagnosticSignError",
					},
				},
			},
			window = {
				position = "left",
				width = 40,
				mapping_options = {
					noremap = true,
					nowait = true,
				},
				mappings = {
					["<Space>"] = "noop",
					["s"] = "noop",
					["ss"] = "open_split",
					["sv"] = "open_vsplit",
					["st"] = "open_tabnew",
					["P"] = {
						"toggle_preview",
						nowait = true,
						config = { use_float = true },
					},
				},
			},
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_hidden = false,
				},
				group_empty_dirs = false,
				hijack_netrw_behavior = "disabled",
				use_libuv_file_watcher = true,
				follow_current_file = {
					enabled = true,
				},
			},
			buffers = {
				follow_current_file = {
					enabled = true,
				},
				group_empty_dirs = true,
				show_unloaded = true,
			},
		})

		vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
	end,
}
