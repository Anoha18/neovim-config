return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	opts = { options = vim.opt.sessionoptions:get() },
  -- stylua: ignore
  keys = {
    { "qs", function() require("persistence").load() end, desc = "Restore Session" },
    { "ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
    { "qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
  },
}
