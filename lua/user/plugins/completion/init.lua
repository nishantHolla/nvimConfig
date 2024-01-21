local cmp = require('cmp')

require('tailwindcss-colorizer-cmp').setup({
  color_square_width = 2,
})

cmp.setup({
  format = require('tailwindcss-colorizer-cmp').formatter,
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<a-s>'] = cmp.mapping.scroll_docs(-4),
    ['<a-d>'] = cmp.mapping.scroll_docs(4),
    ['<a-space>'] = cmp.mapping.complete(),
    ['<a-e>'] = cmp.mapping.abort(),
    ['<a-j>'] = cmp.mapping.select_next_item(),
    ['<a-k>'] = cmp.mapping.select_prev_item(),
    ['<a-;>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
  }, {
    { name = 'buffer' },
  }),
})

cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' },
  }, {
    { name = 'buffer' },
  }),
})

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
  },
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  }),
})

require('user.plugins.lsp')
require('luasnip.loaders.from_vscode').lazy_load()
