-- Theme

local theme = {}

theme.colorscheme = 'kanagawa-wave'

theme.set = function()
  vim.cmd('colorscheme ' .. theme.colorscheme)
end

return theme
