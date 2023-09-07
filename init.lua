-- Base
require("core.base")
require("core.plugins")
require("core.mappings")
require("core.colors")

-- Plugins
require("plugins.neotree")
require("plugins.treesitter")
require("plugins.lsp")
require("plugins.devicons")
require("plugins.cmp")
require("plugins.mason")
require("plugins.lualine")
require("plugins.autopairs")
require("plugins.telescope")
require("plugins.ts-autotag")
require("plugins.lspsaga")
require("plugins.diffview")
require("plugins.indent-blankline")
require("plugins.null-ls")
-- require("plugins.auto-save")
require("plugins.gitsigns")
require("plugins.bufferline")

vim.cmd 'colorscheme material'
