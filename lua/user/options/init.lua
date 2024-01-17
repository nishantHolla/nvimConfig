-- Options

local options = {}

options.list = {
  colorcolumn = '100',
  confirm = true,
  expandtab = true,
  ignorecase = true,
  number = true,
  shiftwidth = 2,
  showmode = false,
  signcolumn = 'yes',
  swapfile = false,
  tabstop = 2,
  termguicolors = true,
  undofile = true,
  wrap = false,
}

options.set = function()

  for key, value in pairs(options.list) do
    vim.opt[key] = value
  end

end

return options
