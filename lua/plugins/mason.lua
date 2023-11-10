return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local status, mason = pcall(require, "mason")
		if not status then
			print("Mason not found")
			return
		end

		local status1, lspconfig = pcall(require, "mason-lspconfig")
		if not status1 then
			print("Mason lspconfig not found")
			return
		end

		mason.setup()

		lspconfig.setup()
	end,
}
