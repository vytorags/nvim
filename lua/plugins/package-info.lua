return {
  {
    'vuki656/package-info.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' },
    ft = { 'json' },
    opts = {},
    keys = {
      {
        '<leader>nps',
        function()
          require('package-info').show()
        end,
        desc = 'Show package versions',
      },
      {
        '<leader>npu',
        function()
          require('package-info').update()
        end,
        desc = 'Update package',
      },
      {
        '<leader>npd',
        function()
          require('package-info').delete()
        end,
        desc = 'Delete package',
      },
      {
        '<leader>npi',
        function()
          require('package-info').install()
        end,
        desc = 'Install new package',
      },
    },
  },
}
