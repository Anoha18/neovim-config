local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring"
    },
    lazy = false,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    lazy = false
  },

  { "neovim/nvim-lspconfig" },

  { "marko-cerovac/material.nvim" },
  { "williamboman/mason-lspconfig.nvim" },

  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/nvim-cmp" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },

  { "williamboman/mason.nvim" },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    }
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
  },
  { "windwp/nvim-ts-autotag" },

  { "nvim-lua/plenary.nvim" },
  {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.2',
  },
  { "nvim-telescope/telescope-file-browser.nvim" },

  {
    "akinsho/nvim-bufferline.lua",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons"
  },

  { "norcalli/nvim-colorizer.lua" },

  { "nvimdev/lspsaga.nvim" },

  { "onsails/lspkind.nvim" },

  {
    "lewis6991/gitsigns.nvim",
    event = "User FileOpened",
    cmd = "Gitsigns",
  },

  { "sindrets/diffview.nvim" },

  { "lukas-reineke/indent-blankline.nvim" },

  { "jose-elias-alvarez/null-ls.nvim" },

  { "tpope/vim-commentary" },

  { "tpope/vim-fugitive" },

  -- { "Pocco81/auto-save.nvim" },
})
