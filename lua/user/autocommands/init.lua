-- Autocommands

local autocommands = {}

autocommands.groups = {
  editing = vim.api.nvim_create_augroup('editing', {clear = true}),
}

autocommands.list = {
  {
    event = 'BufEnter',
    pattern = '?*',
    command = 'set formatoptions-=cro',
    description = 'Stop auto commenting',
  },
  {
    event = 'BufWritePre',
    pattern = '?*',
    command = '%s/\\s\\+$//ge | %s/\\n\\+\\%$//ge',
    description = 'Remove trailing whitespace and newline befor saving',
  },
  {
    event = 'BufWinLeave',
    pattern = '?*',
    command = 'silent! mkview',
    description = 'Save the file state before leaving if possible',
  },
  {
    event = 'BufWinEnter',
    pattern = '?*',
    callback = function()
      local filetype = vim.bo.filetype
      if filetype == 'gitcommit' then return end
      vim.cmd('silent! loadview')
    end,
    description = 'Load the file state after entering if possible',
  },
}

autocommands.set = function()

  for _, auto in pairs(autocommands.list) do
    vim.api.nvim_create_autocmd(auto.event, {
      pattern = auto.pattern,
      command = (not auto.callback) and auto.command or nil,
      callback = auto.callback,
    })
  end

end

return autocommands
