return {
  {
    'folke/zen-mode.nvim',
    cmd = 'ZenMode',
    keys = {
      { '<leader>z', '<cmd>ZenMode<cr>', desc = 'Toggle Zen Mode' },
    },
    opts = {
      plugins = {
        twilight = { enabled = true },
      },
    },
  },
  {
    'hedyhli/outline.nvim',
    cmd = { 'Outline', 'OutlineOpen' },
    keys = {
      { '<leader>o', '<cmd>Outline<CR>', desc = 'Toggle Outline' },
    },
    opts = {},
  },
  {
    'HakonHarnes/img-clip.nvim',
    event = 'VeryLazy',
    keys = {
      { '<leader>p', '<cmd>PasteImage<cr>', desc = 'Paste image from clipboard' },
    },
    opts = {},
  },
}
