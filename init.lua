
NvimConfig = {}

---

NvimConfig.options = require('user.options')
NvimConfig.autocommands = require('user.autocommands')
NvimConfig.keymaps = require('user.keymaps')
NvimConfig.functions = require('user.functions')
NvimConfig.plugins = require('user.plugins')
NvimConfig.theme = require('user.theme')

---

NvimConfig.options.set()
NvimConfig.autocommands.set()
NvimConfig.keymaps.set()
NvimConfig.plugins.set()
NvimConfig.theme.set()
