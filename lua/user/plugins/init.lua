-- Plugins

-- Bootstrap lazy nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

---

local plugins = {}

plugins.list = {

  lualine = {
    'nvim-lualine/lualine.nvim',
    enabled = true,
    hasConfig = true,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    description = 'Statusline plugin',
  },

  kanagawa = {
    'rebelot/kanagawa.nvim',
    enabled = true,
    hasConfig = true,
    description = 'Colorscheme plugin',
  },

  bufferline = {
    'akinsho/bufferline.nvim',
    enabled = true,
    hasConfig = true,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    description = 'Bufferline plugin',
  },

  indentline = {
    'lukas-reineke/indent-blankline.nvim',
    enabled = true,
    hasConfig = true,
    description = 'Indent lines plugin',
  },

  treesitter = {
    'nvim-treesitter/nvim-treesitter',
    enabled = true,
    hasConfig = true,
    description = 'Code parser plugin',
  },

  hop = {
    'phaazon/hop.nvim',
    enabled = true,
    hasConfig = true,
    description = 'Motion plugin',
  },

  fzf = {
    'ibhagwan/fzf-lua',
    enabled = true,
    hasConfig = true,
    description = 'fzf',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  toggleterm = {
    'akinsho/toggleterm.nvim',
    enabled = true,
    hasConfig = true,
    description = 'Temrinal plugin',
  },

  lf = {
    'lmburns/lf.nvim',
    enabled = true,
    hasConfig = true,
    description = 'File manager plugin',
  },

  indentation = {
    'tpope/vim-sleuth',
    enabled = true,
    hasConfig = false,
    description = 'Indentation guesser',
  },

  completion = {
    'hrsh7th/nvim-cmp',
    enabled = true,
    hasConfig = true,
    dependencies = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
      'stevearc/conform.nvim',
      'roobert/tailwindcss-colorizer-cmp.nvim',
    },
    description = 'Completioin plugin',
  },

  autopair = {
    'jiangmiao/auto-pairs',
    enabled = true,
    hasConfig = false,
    description = 'Autopair plugin',
  },

  autoclose = {
    'windwp/nvim-ts-autotag',
    enabled = true,
    hasConfig = true,
    description = 'Autoclose html tags',
  },

  comment = {
    'numToStr/Comment.nvim',
    enabled = true,
    hasConfig = true,
    description = 'Comment plugin',
  },

  lspsaga = {
    'nvimdev/lspsaga.nvim',
    enabled = true,
    hasConfig = true,
    description = 'Lsp enhancer plugin',
  },

  colorizer = {
    'NvChad/nvim-colorizer.lua',
    enabled = true,
    hasConfig = true,
    description = 'Colorizer plugin',
  },

  tailwindSorter = {
    'laytan/tailwind-sorter.nvim',
    enabled = true,
    hasConfig = true,
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim' },
    build = 'cd formatter && npm i && npm run build',
    description = 'Tailwind class sorter plugin',
  },
}

plugins.set = function()
  local list = {}

  for pluginName, plugin in pairs(plugins.list) do
    if plugin.enabled == false then
      goto continue
    end

    if plugin.hasConfig then
      plugin.config = function()
        require('user.plugins.' .. pluginName)
      end
    end

    table.insert(list, plugin)

    ::continue::
  end

  require('lazy').setup(list)
end

return plugins
