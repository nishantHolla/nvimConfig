-- Theme

local theme = {}

vim.g.material_style = "darker"
theme.colorscheme = 'material'

theme.set = function()
  vim.cmd('colorscheme ' .. theme.colorscheme)
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return theme
