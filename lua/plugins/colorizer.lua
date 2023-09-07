return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    local status, colorizer = pcall(require, "colorizer")
    if (not status) then
      print("Colorizer not found")
      return
    end

    colorizer.setup {
      "*";
    }
  end
}
