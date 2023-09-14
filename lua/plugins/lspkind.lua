return {
  "onsails/lspkind.nvim",
  config = function()
    local status, lspkind = pcall(require, "lspkind")
    if (not status) then
      print("Lsp kind not found")
      return
    end

    lspkind.init({
      mode = 'symbol_text',
      preset = 'codicons',
    })
  end
}
