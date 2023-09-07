return {
  "rmagatti/auto-session",
  config = function()
    local status, auto_session = pcall(require, "auto-session")
    if (not status) then
      print("Not found auto session")
      return
    end

    auto_session.setup({
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Work", "~/'My Project'", "/" }
    })
  end
}
