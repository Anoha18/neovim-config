local status, ts_autotag = pcall(require, "nvim-ts-autotag")
if (not status) then
  print("Ts autotag not found")
  return
end

ts_autotag.setup {}
