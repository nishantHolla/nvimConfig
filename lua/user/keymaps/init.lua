-- Keymaps

local keymaps = {}

keymaps.snr = { silent = true, noremap = true }
keymaps.nr = { noremap = true }
keymaps.s = { silent = true }
keymaps.list = { leader = ',' }

local snr = keymaps.snr
local nr = keymaps.nr
local s = keymaps.s

keymaps.list.normal = {

  BufferManagement = {
    { '<leader>SS', ':FormatDisable<cr>:w<cr>:FormatEnable<cr>', snr, 'Write current buffer without formatting' },
    { '<leader>ss', ':w<cr>', snr, 'Write current buffer' },
    { '<leader>sa', ':wa<cr>', snr, 'Write all open buffer' },
    { '<leader>qq', ':lua NvimConfig.functions.closeBuffer()<cr>', snr, 'Close current buffer' },
    { '<leader>qa', ':qa<cr>', snr, 'Close all open buffer' },
  },

  BufferMovement = {
    { '<a-i>', ':bp<cr>', snr, 'Move to previous buffer' },
    { '<a-o>', ':bn<cr>', snr, 'Move to next buffer' },
  },

  ClipboardManagement = {
    { 'd', '"_d', snr, 'Delete without poluting' },
    { 'c', '"_c', snr, 'Change without poluting' },
    { 'x', '"_x', snr, 'Delete character without poluting' },
    { '<leader>d', 'd', snr, 'Delete with poluting' },
    { '<leader>c', 'c', snr, 'Change with poluting' },
    { '<leader>x', 'x', snr, 'Delete character with poluting' },
    { '<leader>y', '"+y', snr, 'Copy to primary clipboard' },
  },

  HighlightManagement = {
    { '<esc>', ':nohl<cr>', snr, 'Clear higlights' },
  },

  SplitMovement = {
    { '<a-h>', '<c-w>h', snr, 'Move focus to left split' },
    { '<a-j>', '<c-w>j', snr, 'Move focus to bottom split' },
    { '<a-k>', '<c-w>k', snr, 'Move focus to top split' },
    { '<a-l>', '<c-w>l', snr, 'Move focus to right split' },
  },

  TextMovement = {
    { '<a-s>', ':m .+1<CR>==', snr, 'Move current line down' },
    { '<a-d>', ':m .-2<CR>==', snr, 'Move current line up' },
  },

  ---

  HopPlugin = {
    plugin = 'hop',
    { '<leader>f', ':HopAnywhere<cr>', snr, 'Hop anywhere in the visible region' },
    { 'f', ':HopChar1CurrentLine<cr>', snr, 'Hop in current line' },
    { 'F', 'f', snr, 'Default find' },
  },

  LfPlugin = {
    plugin = 'lf',
    { '<leader>;', ':Lf<cr>', snr, 'Open lf' },
  },

  LspPlugin = {
    plugin = 'completion',
    { '[d', ':lua vim.diagnostic.goto_prev()<cr>', snr, 'Goto previous diagnostic' },
    { ']d', ':lua vim.diagnostic.goto_next()<cr>', snr, 'Goto next diagnostic' },
  },

  FzfPlugin = {
    plugin = 'fzf',
    { '<leader><space>', ':FzfLua<cr>', snr, 'Open fzf lua' },
    { '<leader>o', ':FzfLua git_files<cr>', snr, 'Open fzf lua git files' },
    { '<leader><a-o>', ':FzfLua files<cr>', snr, 'Open fzf lua files' },
    { '<leader>O', ':FzfLua files cwd=~<cr>', snr, 'Open fzf lua files global' },
  },

  ToggleTermPlugin = {
    plugin = 'toggleterm',
    { '<a-`>', ':lua NvimConfig.functions.toggleTerminal(10)<cr>', snr, 'Open terminal 10' },
    { '<a-1>', ':lua NvimConfig.functions.toggleTerminal(1)<cr>', snr, 'Open terminal 10' },
    { '<a-2>', ':lua NvimConfig.functions.toggleTerminal(2)<cr>', snr, 'Open terminal 10' },
  },
}

keymaps.list.insert = {

  ModeMovement = {
    { '<leader><leader>', '<esc>', snr, 'Move to normal mode' },
  },

  TextMovement = {
    { '<a-h>', '<left>', snr, 'Move cursor left by one chracter' },
    { '<a-j>', '<down>', snr, 'Move cursor down by one line' },
    { '<a-k>', '<up>', snr, 'Move cursor up by one line' },
    { '<a-l>', '<right>', snr, 'Move cursor right by one chracter' },
  },
}

keymaps.list.visual = {

  ClipboardManagement = {
    { 'd', '"_d', snr, 'Delete without poluting' },
    { 'c', '"_c', snr, 'Change without poluting' },
    { 'x', '"_x', snr, 'Delete character without poluting' },
    { '<leader>d', 'd', snr, 'Delete with poluting' },
    { '<leader>c', 'c', snr, 'Change with poluting' },
    { '<leader>x', 'x', snr, 'Delete character with poluting' },
    { '<leader>y', '"+y', snr, 'Copy to primary clipboard' },
  },

  TextMovement = {
    { '<a-s>', ":m '>+1<CR>gv=gv", snr, 'Move selected line down' },
    { '<a-d>', ":m '<-2<CR>gv=gv", snr, 'Move selected line up' },
  },
}

keymaps.list.terminal = {
  ModeMovement = {
    { '<leader><leader>', '<c-\\><c-n>', snr, 'Move to normal mode' },
  },
  ---

  ToggleTermPlugin = {
    plugin = 'toggleterm',
    { '<a-`>', '<c-\\><c-n>:lua NvimConfig.functions.toggleTerminal(10)<cr>', snr, 'Open terminal 10' },
    { '<a-1>', '<c-\\><c-n>:lua NvimConfig.functions.toggleTerminal(1)<cr>', snr, 'Open terminal 10' },
    { '<a-2>', '<c-\\><c-n>:lua NvimConfig.functions.toggleTerminal(2)<cr>', snr, 'Open terminal 10' },
  },
}

keymaps.setLsp = function()
  keymaps.list.normal.Lsp = {
    { 'gD', vim.lsp.buf.declaration, snr, 'Goto declaration from LSP' },
    { 'gd', vim.lsp.buf.definition, snr, 'Goto definition from LSP' },
    { 'gi', vim.lsp.buf.implementation, snr, 'Goto implementation from LSP' },
    { 'K', vim.lsp.buf.hover, snr, 'See info from LSP' },
    { '<c-k>', vim.lsp.buf.signature_help, snr, 'See signature from LSP' },
    { '<leader>lwa', vim.lsp.buf.add_workspace_folder, snr, 'Add workspace folder for LSP' },
    { '<leader>lwd', vim.lsp.buf.remove_workspace_folder, snr, 'Add workspace folder for LSP' },
  }

  keymaps.list.normal.Lspsaga = {
    { '<leader>lca', ':Lspsaga code_action<cr>', snr, 'Code actions from LSPsaga' },
    { '<leader>lb', ':Lspsaga show_buf_diagnostics<cr>', snr, 'Buffer diagnostics from LSPsaga' },
    { '<leader>lw', ':Lspsaga show_workspace_diagnostics<cr>', snr, 'Workspace diagnostics from LSPsaga' },
    { '<leader>ld', ':Lspsaga peek_definition<cr>', snr, 'Peek definitions from LSPsaga' },
    { '<leader>lD', ':Lspsaga peek_type_definition<cr>', snr, 'Peek definitions from LSPsaga' },
    { '<leader>l[', ':Lspsaga diagnostic_jump_prev<cr>', snr, 'Goto previous diagnostic from LSPsaga' },
    { '<leader>l]', ':Lspsaga diagnostic_jump_next<cr>', snr, 'Goto next diagnostic from LSPsaga' },
    { '<leader>lf', ':Lspsaga finder<cr>', snr, 'Finder from LSPsaga' },
    { '<leader>lrn', ':Lspsaga rename<cr>', snr, 'Type rename from LSPsaga' },
    { '<leader>lo', ':Lspsaga outline<cr>', snr, 'Outline from LSPsaga' },
  }

  keymaps.setMode({ Lsp = keymaps.list.normal.Lsp }, 'n')
  keymaps.setMode({ LspsagaPlugin = keymaps.list.normal.Lspsaga }, 'n')
end

keymaps.setMode = function(list, mode)
  for _, group in pairs(list) do
    if group.plugin then
      if NvimConfig.plugins.list[group.plugin].enabled == false then
        goto continue
      end
    end

    group.plugin = nil

    for _, map in pairs(group) do
      map[3].desc = map[4]
      vim.keymap.set(mode, map[1], map[2], map[3])
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
