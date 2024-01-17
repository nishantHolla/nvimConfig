-- Keymaps

local keymaps = {}

keymaps.snr = {silent = true, noremap = true}
keymaps.nr = {noremap = true}
keymaps.s = {silent = true}
keymaps.list = { leader = ',' }

local snr = keymaps.snr
local nr = keymaps.nr
local s=  keymaps.s

keymaps.list.normal = {

  BufferManagement = {
    {'<leader>ss', ':w<cr>', snr, 'Write current buffer'},
    {'<leader>sa', ':wa<cr>', snr, 'Write all open buffer'},
    {'<leader>qq', ':lua NvimConfig.functions.closeBuffer()<cr>', snr, 'Close current buffer'},
    {'<leader>qa', ':qa<cr>', snr, 'Close all open buffer'},
  },

  BufferMovement = {
    {'<a-i>', ':bp<cr>', snr, 'Move to previous buffer'},
    {'<a-o>', ':bn<cr>', snr, 'Move to next buffer'},
  },

  ClipboardManagement = {
    {'d', '"_d', snr, 'Delete without poluting'},
    {'c', '"_c', snr, 'Change without poluting'},
    {'x', '"_x', snr, 'Delete character without poluting'},
    {'<leader>d', 'd', snr, 'Delete with poluting'},
    {'<leader>c', 'c', snr, 'Change with poluting'},
    {'<leader>x', 'x', snr, 'Delete character with poluting'},
  },

  SplitMovement = {
    {'<a-h>', '<c-w>h', snr, 'Move focus to left split'},
    {'<a-j>', '<c-w>j', snr, 'Move focus to bottom split'},
    {'<a-k>', '<c-w>k', snr, 'Move focus to top split'},
    {'<a-l>', '<c-w>l', snr, 'Move focus to right split'},
  },

  TextMovement = {
    {'<a-s>', ':m .+1<CR>==', snr, 'Move current line down'},
    {'<a-d>', ':m .-2<CR>==', snr, 'Move current line up'},
  },

  ---

  HopPlugin = {
    plugin = 'hop',
    {'<leader>f', ':HopAnywhere<cr>', snr, 'Hop anywhere in the visible region'},
    {'f', ':HopChar1CurrentLine<cr>', snr, 'Hop in current line'},
    {'F', 'f', snr, 'Default find'},
  },

  LfPlugin = {
    plugin = 'lf',
    {'<leader>;', ':Lf<cr>', snr, 'Open lf'},
  },

  TelescopePlugin = {
    plugin = 'telescope',
    {'<leader>t', ':lua NvimConfig.functions.openTelescope("builtin")<cr>', snr, 'Open telescope'},
  },

  ToggleTermPlugin = {
    plugin = 'toggleterm',
    {'<a-`>', ':lua NvimConfig.functions.toggleTerminal(10)<cr>', snr, 'Open terminal 10'},
    {'<a-1>', ':lua NvimConfig.functions.toggleTerminal(1)<cr>', snr, 'Open terminal 10'},
    {'<a-2>', ':lua NvimConfig.functions.toggleTerminal(2)<cr>', snr, 'Open terminal 10'},
  },


}

keymaps.list.insert = {

  ModeMovement = {
    {'<leader><leader>', '<esc>', snr, 'Move to normal mode'},
  },

  TextMovement = {
    {'<a-h>', '<left>', snr, 'Move cursor left by one chracter'},
    {'<a-j>', '<down>', snr, 'Move cursor down by one line'},
    {'<a-k>', '<up>', snr, 'Move cursor up by one line'},
    {'<a-l>', '<right>', snr, 'Move cursor right by one chracter'},
  },

}

keymaps.list.visual = {

  ClipboardManagement = {
    {'d', '"_d', snr, 'Delete without poluting'},
    {'c', '"_c', snr, 'Change without poluting'},
    {'x', '"_x', snr, 'Delete character without poluting'},
    {'<leader>d', 'd', snr, 'Delete with poluting'},
    {'<leader>c', 'c', snr, 'Change with poluting'},
    {'<leader>x', 'x', snr, 'Delete character with poluting'},
  },

  TextMovement = {
    {'<a-s>', ":m '>+1<CR>gv=gv", snr, 'Move selected line down'},
    {'<a-d>', ":m '<-2<CR>gv=gv", snr, 'Move selected line up'},
  },

}

keymaps.list.terminal = {
  ModeMovement = {
    {'<leader><leader>', '<c-\\><c-n>', snr, 'Move to normal mode'},
  },
  ---

  ToggleTermPlugin = {
    plugin = 'toggleterm',
    {'<a-`>', '<c-\\><c-n>:lua NvimConfig.functions.toggleTerminal(10)<cr>', snr, 'Open terminal 10'},
    {'<a-1>', '<c-\\><c-n>:lua NvimConfig.functions.toggleTerminal(1)<cr>', snr, 'Open terminal 10'},
    {'<a-2>', '<c-\\><c-n>:lua NvimConfig.functions.toggleTerminal(2)<cr>', snr, 'Open terminal 10'},
  },
}


keymaps.setMode = function(list, mode)

  for _, group in pairs(list) do
    if group.plugin then
      if NvimConfig.plugins.list[group.plugin].enabled == false then
        goto continue
      end
    end

    group.plugin = nil

    for _, map in pairs(group) do
      vim.api.nvim_set_keymap(mode, map[1], map[2], map[3])
    end

    ::continue::
  end

end

keymaps.set = function()
  vim.g.mapleader = keymaps.list.leader

  keymaps.setMode(keymaps.list.normal, 'n')
  keymaps.setMode(keymaps.list.insert, 'i')
  keymaps.setMode(keymaps.list.visual, 'v')
  keymaps.setMode(keymaps.list.terminal, 't')

end

return keymaps
