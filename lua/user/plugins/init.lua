-- Plugins

-- Bootstrap lazy nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
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
    description = 'Colorscheme plugin'
  },

  bufferline = {
    'akinsho/bufferline.nvim',
    enabled = true,
    hasConfig = true,
    dependencies = 'nvim-tree/nvim-web-devicons',
    description = 'Bufferline plugin',
  },

  indentline = {
    'lukas-reineke/indent-blankline.nvim',
    enabled = true,
    hasConfig = true,
    description = 'Indent lines plugin'
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

  require("lazy").setup(list)
end


return plugins
