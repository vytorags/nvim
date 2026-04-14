return {
  {
    'nvim-java/nvim-java',
    ft = { 'java' },
    config = function()
      if not require('nixCatsUtils').isNixCats then
        -- allow nvim-java to manage jdtls install
        require('java').setup()
      else
        -- disable auto setup; jdtls is configured in lspconfig.lua
      end
    end,
    keys = {
      { '<leader>jt', '<cmd>JavaTestRunCurrentClass<cr>', desc = 'JavaTestRunCurrentClass' },
      { '<leader>jd', '<cmd>JavaTestDebugCurrentClass<cr>', desc = 'JavaTestDebugCurrentClass' },
      { '<leader>jb', '<cmd>JavaBuild<cr>', desc = 'Java build' },
      { '<leader>jr', '<cmd>JavaRunMain<cr>', desc = 'Java run main' },
    },
  },
}
