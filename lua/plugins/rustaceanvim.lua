return {
  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    lazy = false,
    ft = { 'rust' },
    config = function()
      if not require('nixCatsUtils').isNixCats then
        -- allow rustaceanvim to manage rust_analyzer install
      else
        -- disable auto setup; rust_analyzer is configured in lspconfig.lua
        vim.g.rustaceanvim = {
          server = {
            auto_attach = false,
          },
        }
      end
    end,
    keys = {
      { '<leader>rr', '<cmd>RustLsp runnables<cr>', desc = 'RustLsp runnables' },
      { '<leader>rd', '<cmd>RustLsp debuggables<cr>', desc = 'RustLsp debuggables' },
      { '<leader>re', '<cmd>RustLsp expandMacro<cr>', desc = 'RustLsp expandMacro' },
      { '<leader>rc', '<cmd>RustLsp openCargo<cr>', desc = 'RustLsp openCargo' },
      { '<leader>rh', '<cmd>RustLsp hover actions<cr>', desc = 'RustLsp hover actions' },
    },
  },
}
