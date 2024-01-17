local actions = require('telescope.actions')

require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ['<a-j>'] = actions.move_selection_next,
        ['<a-k>'] = actions.move_selection_previous,
        ['<a-l>'] = actions.select_default,
        ['<a-h>'] = actions.close,
        ['<a-;>'] = actions.select_horizontal,
        ['<a-:>'] = actions.select_vertical,
        ['f<space>'] = actions.toggle_selection,
        ['<a-a>'] = actions.preview_scrolling_left,
        ['<a-s>'] = actions.preview_scrolling_down,
        ['<a-d>'] = actions.preview_scrolling_up,
        ['<a-f>'] = actions.preview_scrolling_right,
      },
    },
  },
})

require('telescope').load_extension('fzf')
