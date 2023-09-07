return {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    local status, indent_blankline = pcall(require, 'indent_blankline')
    if (not status) then
      print("Indent blankline not found")
      return 
    end

    indent_blankline.setup {
      show_current_context = true,
      show_current_context_start = true
    }
  end
}

