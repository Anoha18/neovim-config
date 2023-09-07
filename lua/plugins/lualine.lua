return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  },
  config = function()
    local status, lualine = pcall(require, "lualine")
    if (not status) then
      print("Lualine not found")
      return
    end

    lualine.setup {
      sections = {
        lualine_a = {
          {
            'mode',
            color = { fg = "white" }
          }
        },
        lualine_z = {
          {
            'location',
            color = { fg = "white" }
          }
        }
      }
    }
  end
}
