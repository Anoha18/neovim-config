local status, lspsaga = pcall(require, "lspsaga")
if (not status) then
  print("Lspsaga not found")
  return
end

lspsaga.setup {
  server_filetype_map = {}
}
