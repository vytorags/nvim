return {
  'ray-x/go.nvim',
  dependencies = { -- optional packages
    'ray-x/guihua.lua',
    'neovim/nvim-lspconfig',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    diagnostic = false,
    lsp_gofumpt = true,
    -- lsp_keymaps = false,
    -- other options
  },
  keys = {
    { "<leader>got", "<cmd>GoTest<cr>", desc = "GoTest (current func)" },
    { "<leader>goc", "<cmd>GoCoverage toggle<cr>", desc = "GoCoverage toggle" },
    { "<leader>goi", "<cmd>GoImpl<cr>", desc = "GoImpl" },
    { "<leader>gos", "<cmd>GoFillStruct<cr>", desc = "GoFillStruct" },
    { "<leader>goT", "<cmd>GoAddTag<cr>", desc = "GoAddTag" },
  },
  -- config = function(lp, opts)
  --     require("go").setup(opts)
  --     local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
  --     vim.api.nvim_create_autocmd("BufWritePre", {
  --         pattern = "*.go",
  --         callback = function()
  --             require("go.format").goimports()
  --         end,
  --         group = format_sync_grp,
  --     })
  -- end,
  event = { 'CmdlineEnter' },
  ft = { 'go', 'gomod' },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
