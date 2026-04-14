return {
  {
    'adalessa/laravel.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'tpope/vim-dotenv',
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
    },
    cmd = { 'Laravel' },
    keys = {
      { '<leader>laa', ':Laravel artisan<cr>', desc = 'Laravel Artisan picker' },
      { '<leader>lar', ':Laravel routes<cr>', desc = 'Laravel Route list' },
      { '<leader>lam', ':Laravel related<cr>', desc = 'Laravel Model info' },
      { '<leader>lat', ':Laravel tinker<cr>', desc = 'Laravel Tinker' },
    },
    opts = {
      lsp_server = 'intelephense',
      features = {
        null_ls = {
          enabled = false,
        },
        route_info = {
          enabled = false,
        },
        model_info = {
          enabled = false,
        },
        composer_info = {
          enabled = false,
        },
      },
    },
    config = function(_, opts)
      local ok, laravel = pcall(require, 'laravel')
      if ok then
        laravel.setup(opts)
      end
    end,
    -- Only load in actual Laravel projects to prevent background task crashes
    cond = function()
      return vim.fn.filereadable 'artisan' == 1
    end,
  },
}
