return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local status, which_key = pcall(require, "which-key")
    if (not status) then
      print("Not found which key")
      return
    end

    vim.o.timeout = true
    vim.o.timeoutlen = 300
    which_key.setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}
