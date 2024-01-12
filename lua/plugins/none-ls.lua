return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.diagnostics.checkstyle.with({
					extra_args = { "-c", "/home/lone/.config/nvim/google_check.xml" },
				}),
			},
		})
		vim.keymap.set("n", "<leader>fg", vim.lsp.buf.format, {})
	end,
}
