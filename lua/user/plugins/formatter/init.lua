local util = require('formatter.util')

local formatters = {
  lua = { name = 'stylua' },
  python = { name = 'black' },
  c = { name = 'clangformat' },
  css = { name = 'prettier' },
  sass = { ft = 'css', name = 'prettier' },
  scss = { ft = 'css', name = 'prettier' },
  cpp = { name = 'clangformat' },
  javascript = { name = 'prettier' },
  javascriptreact = { name = 'prettier' },
  typescript = { name = 'prettier' },
  typescriptreact = { name = 'prettier' },
  html = { name = 'prettier' },
}

local config = {}

for filetype, formatter in pairs(formatters) do
  local file = formatter.ft or filetype
  config[filetype] = { require('formatter.filetypes.' .. file)[formatter.name] }
end

config['*'] = {
  require('formatter.filetypes.any').remove_trailing_whitespace,
}

require('formatter').setup({
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = config,
})
