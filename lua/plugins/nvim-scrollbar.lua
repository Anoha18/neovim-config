return {
  "petertriho/nvim-scrollbar",
  config = function ()
    local status, scrollbar = pcall(require, "scrollbar")
    if not status then
      print("Scrollbar not found")
      return
    end

    scrollbar.setup {}
  end
}
