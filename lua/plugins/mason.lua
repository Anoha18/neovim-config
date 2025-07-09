return {
	"williamboman/mason.nvim",
  -- lazy = false,
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
  version = '2.0.0',
  -- TODO: Вернуть версию, как пофиксят определение npm пути в windows. Ссылка на проблему https://github.com/mason-org/mason.nvim/issues/1961
  -- Сейчас обходной путь использовать последний рабочий коммит.
  -- commit = "2fca788",
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

		mason.setup({
			PATH = "prepend",
		})

		lspconfig.setup()
	end,
}
