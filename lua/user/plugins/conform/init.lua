require('conform').setup({
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'black' },
    c = { 'clangd' },
    cpp = { 'clangd' },
    javascript = { { 'prettierd', 'prettier' } },
    typescript = { { 'prettierd', 'prettier' } },
    javascriptreact = { { 'prettierd', 'prettier' } },
    typescriptreact = { { 'prettierd', 'prettier' } },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})
