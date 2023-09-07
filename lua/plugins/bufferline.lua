return {
  "akinsho/nvim-bufferline.lua",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local status, bufferline = pcall(require, "bufferline")
    if (not status) then
      print("Bufferline not found")
      return
    end

    local c = require "material.colors"

    bufferline.setup {
      options = {
        mode = 'tabs',
        separator_style = 'slant',
        always_show_bufferline = false,
        show_buffer_close_icons = true,
        show_close_icon = false,
        color_icons = true,
        -- diagnostics = "nvim_lsp"
      },
      highlights = {
        separator = {
          fg = c.editor.bg_alt
        },
        separator_selected = {
          fg = c.editor.bg_alt
        },
        background = {
          fg = c.editor.disabled,
        },
        tab_selected = {
          fg = c.editor.fg,
        },
        buffer_selected = {
          fg = c.editor.fg,
          italic = true,
          bold = true,
        },
        fill = {
          bg = c.editor.bg_alt
        },
        close_button = {
          fg = c.main.darkred
        },
        close_button_selected = {
          fg = c.main.darkred
        },
      }
    }
  end
}
