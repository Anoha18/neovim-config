local status, gitsigns = pcall(require, "gitsigns")
if (not status) then
  print("Gitsigns not found")
  return
end

gitsigns.setup({
  signs = {
    add = { text = '+' }
  },
  current_line_blame = true,
  signcolumn = true,
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
})

