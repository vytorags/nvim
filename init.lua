require('nixCatsUtils').setup {
  non_nix_value = true,
}

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = nixCats 'have_nerd_font'

require 'config.options'
require 'config.keymaps'
require 'config.lskeymap'
require 'config.perf'

local function getlockfilepath()
  if require('nixCatsUtils').isNixCats and type(nixCats.settings.unwrappedCfgPath) == 'string' then
    return nixCats.settings.unwrappedCfgPath .. '/lazy-lock.json'
  else
    return vim.fn.stdpath 'config' .. '/lazy-lock.json'
  end
end
local lazyOptions = {
  lockfile = getlockfilepath(),
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
}

local lazySpecs = {
  { import = 'plugins' },
  { import = 'plugins.ui' },
  { import = 'plugins.lsp.lspconfig' },
  { import = 'plugins.lsp.typescript-tools' },
}

local nixCatsUtils = require 'nixCatsUtils'

if not nixCatsUtils.isNixCats then
  table.insert(lazySpecs, {
    { import = 'plugins.lsp.mason' },
    { import = 'plugins.lsp.typescript-tools' },
  })
end

require('nixCatsUtils.lazyCat').setup(nixCats.pawsible { 'allPlugins', 'start', 'lazy.nvim' }, lazySpecs, lazyOptions)
