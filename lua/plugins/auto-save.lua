local status, auto_save = pcall(require, "auto-save")
if (not status) then
  print("Auto save not found")
  return
end

auto_save.setup {
  enabled = false,
  -- trigger_events = { "InsertLeave", "TextChanged" },
  -- write_all_buffers = false,
}
