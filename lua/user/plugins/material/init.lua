require('material').setup({

  contrast = {
    terminal = false,
    sidebars = false,
    floating_windows = false,
    cursor_line = false,
    non_current_windows = false,
    filetypes = {},
  },

  styles = {
    comments = {italic = true},
    strings = { bold = true },
    keywords = { underline = false },
    functions = { bold = true, undercurl = false },
    variables = {},
    operators = {},
    types = {},
  },

  plugins = {
    "dap",
    "gitsigns",
    "hop",
    "illuminate",
    "indent-blankline",
    "lspsaga",
    "nvim-cmp",
    "nvim-web-devicons",
    "telescope",
  },

  disable = {
    colored_cursor = false,
    borders = false,
    background = true,
    term_colors = false,
    eob_lines = false
  },

  high_visibility = {
    lighter = false,
    darker = false
  },

  lualine_style = "stealth", -- Lualine style ( can be 'stealth' or 'default' )

  async_loading = true,

  custom_colors = nil,

  custom_highlights = {},
})
