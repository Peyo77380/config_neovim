local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end


local protocol = require('vim.lsp.protocal')

local on_attach = function (client, bufnr)
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("Format", { clear = true }),
			buffer = bufnr,
			callback = function () vim.lsp.buf.formatting_seq_sync() end
		})
	end
end

nvim_lsp.phpactor.setup{}
nvim_lsp.cssls.setup{}
nvim_lsp.html.setup{}
nvim_lsp.bashls.setup{}
nvim_lsp.tsserver.setup{
	on_attach = on_attach,
	filetypes = { "javascript", "typescript", "typescript.tsx", "typescriptreact" },
	cmd = { "typescript-language-server", "--stdio" },
	capabilities = capabilities
}

