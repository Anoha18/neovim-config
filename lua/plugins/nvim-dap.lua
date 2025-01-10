return {
	"mfussenegger/nvim-dap",
  enabled = false,
	config = function()
		local status, dap = pcall(require, "dap")
		if not status then
			print("DAP not found")
			return
		end

		-- TODO: Добавить конфигурацию дебаггера
	end,
}
