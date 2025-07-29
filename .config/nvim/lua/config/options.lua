-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.relativenumber = true
vim.o.guicursor = ""
vim.o.incsearch = true
vim.o.hlsearch = false
vim.o.showmode = true

vim.g.lazyvim_prettier_needs_config = false

-- disable virtual_text
vim.diagnostic.config({ virtual_text = false, float = {
  source = true,
} })
-- if vim.diagnostic.config is being overwritten somewhere and
-- virtual_text is not being disabled then the following can
-- be used to disable virtual_text
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
})

vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_python_ruff = "ruff"
-- vim.g.lazyvim_rust_diagnostics = "rust-analyzer"

vim.fn.sign_define(
  "DapBreakpoint",
  { text = "🔴", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
