vim.cmd("autocmd!")

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.clipboard = "unnamedplus"
vim.opt.clipboard:prepend({ "unnamed", "unnamedplus" })
vim.opt.fixendofline = false
vim.opt.fixeol = false
vim.opt.completeopt = "menuone,noselect"
vim.api.nvim_command([[ set ff=dos]])

--[[ Encdodings ]]
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileformats = "dos,unix,mac"
vim.opt.fileformat = "dos"

vim.wo.number = true
vim.opt.syntax = "on"

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.hlsearch = true
vim.opt.relativenumber = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = "fish"
vim.opt.inccommand = "split"
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.ai = true
vim.opt.si = true
vim.opt.wrap = false
vim.opt.backspace = "start,eol,indent"
vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true

vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

vim.opt.formatoptions:append({ "r" })

vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = "pum"
vim.opt.pumblend = 5
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"

vim.g.spellfile_URL = "https://ftp.nluug.nl/pub/vim/runtime/spell/"
vim.opt.spelllang = "en_us,ru"
vim.opt.spell = true

vim.opt.swapfile = false

vim.opt.laststatus = 0
vim.api.nvim_set_hl(0 , 'Statusline', {link = 'Normal'})
vim.api.nvim_set_hl(0 , 'StatuslineNC', {link = 'Normal'})
local str = string.rep('-', vim.api.nvim_win_get_width(0))
vim.opt.statusline = str

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.ejs",
  command = "set filetype=html"
})

vim.lsp.inlay_hint.enable()
