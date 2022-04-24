local null_ls_status_ok, null_ls = pcall(require, 'null_ls')
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/completion
local completion = null_ls.builtins.completion

null_ls.setup({
	debug = false,
	sources = {
		formatting.eslint,
		diagnostics.eslint,
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
        completion.spell,
		formatting.stylua,
		formatting.tidy,
        -- diagnostics.flake8
	},
})
