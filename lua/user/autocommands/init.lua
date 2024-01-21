-- Autocommands

local autocommands = {}

autocommands.groups = {
  editing = vim.api.nvim_create_augroup('editing', { clear = true }),
}

autocommands.list = {
  {
    event = 'BufEnter',
    pattern = '?*',
    command = 'set formatoptions-=cro',
    group = autocommands.groups.editing,
    description = 'Stop auto commenting',
  },
  {
    event = 'BufWinLeave',
    pattern = '?*',
    command = 'silent! mkview',
    group = autocommands.groups.editing,
    description = 'Save the file state before leaving if possible',
  },
  {
    event = 'BufWinEnter',
    pattern = '?*',
    callback = function()
      local filetype = vim.bo.filetype
      if filetype == 'gitcommit' then
        return
      end
      vim.cmd('silent! loadview')
    end,
    group = autocommands.groups.editing,
    description = 'Load the file state after entering if possible',
  },
  {
    event = 'LspAttach',
    callback = NvimConfig.functions.setLsp,
    group = autocommands.groups.editing,
    description = 'Setup Lsp on attach',
  },
  {
    event = 'BufWinEnter',
    pattern = '?*.tpp',
    command = 'set filetype=cpp',
    group = autocommands.groups.editing,
    description = 'Consider tpp files as cpp files',
  },
}

autocommands.set = function()
  for _, auto in pairs(autocommands.list) do
    vim.api.nvim_create_autocmd(auto.event, {
      pattern = auto.pattern,
      command = (not auto.callback) and auto.command or nil,
      callback = auto.callback,
      group = auto.group,
    })
  end
end

return autocommands
