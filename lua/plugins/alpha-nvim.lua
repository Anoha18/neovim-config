return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = function()
		local dashboard = require("alpha.themes.dashboard")
		local username = "Владислав"
		local logo = [[

      ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ 
      ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ 
      ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ 
      ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ 
      ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ 
      ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ 

    ]]

		local function getGreeting(name)
			local tableTime = os.date("*t")
			local datetime = os.date(" %Y-%m-%d   %H:%M:%S")
			local hour = tableTime.hour
			local greetingsTable = {
				[1] = "  Спокойной ночи",
				[2] = "  Доброе утро",
				[3] = "  Добрый день",
				[4] = "  Добрый вечер",
				[5] = "󰖔  Доброй ночи",
			}
			local greetingIndex = 0
			if hour == 23 or hour < 7 then
				greetingIndex = 1
			elseif hour < 12 then
				greetingIndex = 2
			elseif hour >= 12 and hour < 18 then
				greetingIndex = 3
			elseif hour >= 18 and hour < 21 then
				greetingIndex = 4
			elseif hour >= 21 then
				greetingIndex = 5
			end

			return "\t\t\t" .. datetime .. "\t" .. greetingsTable[greetingIndex] .. ", " .. name
		end

		local greeting = getGreeting(username)
		dashboard.section.header.val = vim.split(logo .. "\n" .. greeting, "\n")
		dashboard.section.buttons.val = {
			dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
			dashboard.button("g", "󰷾 " .. " Find text", ":Telescope live_grep <CR>"),
			dashboard.button("b", " " .. " File browser", ":Telescope file_browser <CR>"),
			dashboard.button("s", "󰑓 " .. " Restore session", ":lua require('persistence').load()<CR>"),
			dashboard.button(
				"S",
				"󱞳 " .. " Restore last session",
				":lua require('persistence').load({ last = true })<CR>"
			),
			dashboard.button("r", "󰄉 " .. " Recent files", ":Telescope oldfiles <CR>"),
			dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
			dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
			dashboard.button("q", " " .. " Quit", ":qa<CR>"),
		}
		for _, button in ipairs(dashboard.section.buttons.val) do
			button.opts.hl = "AlphaButtons"
			button.opts.hl_shortcut = "AlphaShortcut"
		end
		dashboard.section.header.opts.hl = "AlphaHeader"
		dashboard.section.buttons.opts.hl = "AlphaButtons"
		dashboard.section.footer.opts.hl = "AlphaFooter"
		dashboard.opts.layout[1].val = 8
		return dashboard
	end,
	config = function(_, dashboard)
		local status, alpha = pcall(require, "alpha")
		if not status then
			print("Alpha not found")
		end

		if vim.o.filetype == "lazy" then
			vim.cmd.close()
			vim.api.nvim_create_autocmd("User", {
				pattern = "AlphaReady",
				callback = function()
					require("lazy").show()
				end,
			})
		end

		alpha.setup(dashboard.opts)

		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			callback = function()
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				local version = "  󰥱 v"
					.. vim.version().major
					.. "."
					.. vim.version().minor
					.. "."
					.. vim.version().patch
				local plugins = "⚡Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
				local footer = version .. "\t" .. plugins .. "\n"
				dashboard.section.footer.val = footer
				pcall(vim.cmd.AlphaRedraw)
			end,
		})

		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				vim.cmd("Alpha")
			end,
		})
	end,
}
