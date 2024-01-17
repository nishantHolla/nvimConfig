-- Functions

local functions = {}

function string.starts(String,Start)
  return string.sub(String,1,string.len(Start))==Start
end

functions.closeBuffer = function()
  local lsOutput = vim.api.nvim_command_output('ls')
  local count  = select(2, lsOutput:gsub('\n', '\n')) + 1

  if count == 1 then
    vim.cmd('q')
  else
    vim.cmd('bd')
  end

end

functions.openTelescope = function(picker)
  if NvimConfig.plugins.list.telescope.enabled == false then
    return
  end

  vim.cmd('Telescope ' .. picker .. ' theme=ivy')
end

functions.toggleTerminal = function(id)
  id = tostring(id)

  vim.cmd(id .. 'ToggleTerm')

  local name = vim.api.nvim_buf_get_name(0)
  if string.starts(name, 'term://') then
    vim.cmd('norm i')
  end
end

functions.setLsp = function(ev)
  vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
  NvimConfig.keymaps.setLsp()
end

return functions
