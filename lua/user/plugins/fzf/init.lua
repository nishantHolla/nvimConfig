local actions = require('fzf-lua.actions')
local fileEditKeymaps = {
  ['alt-l'] = actions.file_edit,
  ['alt-s'] = actions.file_split,
  ['alt-v'] = actions.file_vsplit,
}

require('fzf-lua').setup({
  winopts = {
    split = 'belowright new',
    preview = {
      horizontal = 'right:50%',
    },
  },
  keymap = {
    fzf = {
      ['alt-j'] = 'down',
      ['alt-k'] = 'up',
      ['alt-h'] = 'cancel',
    },
  },
  builtin = {
    actions = {
      ['alt-l'] = actions.run_builtin,
    },
  },
  files = {
    actions = fileEditKeymaps,
  },
  lsp = {
    symbols = {
      actions = fileEditKeymaps,
    },
    finder = {
      actions = fileEditKeymaps,
    },
  },
  grep = {
    actions = fileEditKeymaps,
  },
  defaults = {
    cwd_prompt_shorten_len = 100,
  },
})
