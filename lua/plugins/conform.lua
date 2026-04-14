---@diagnostic disable: deprecated, return-type-mismatch
return {
  {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local conform = require 'conform'

      conform.setup {
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },

        formatters_by_ft = {
          lua = { 'stylua' },
          python = { 'black' },
          javascript = { 'prettier' },
          typescript = { 'prettier' },
          json = { 'prettier' },
          html = { 'prettier' },
          css = { 'prettier' },
          vue = { 'prettier' },
          sh = { 'shfmt' },
          nix = { 'nixfmt' },
          ejs = { 'prettier' },
          go = { 'go fmt' },
          php = function()
            local util = require('lspconfig').util
            return function(params)
              local root = util.root_pattern('artisan', 'composer.json', '.git')(params.bufname)
              if root and util.path.exists(util.path.join(root, 'artisan')) then
                return { 'pint' }
              else
                return { 'php-cs-fixer' }
              end
            end
          end,
          qml = { 'qmlfmt' },
          rust = { 'rustfmt' },
        },
      }

      -- vim.api.nvim_create_autocmd('BufWritePre', {
      --   callback = function(args)
      --     local name = vim.api.nvim_buf_get_name(args.buf)
      --     if name:match 'Makefile$' then
      --       return
      --     end
      --
      --     require('conform').format { bufnr = args.buf }
      --
      --     local view = vim.fn.winsaveview()
      --     vim.cmd [[%s/\t/    /ge]]
      --     vim.fn.winrestview(view)
      --   end,
      -- })
    end,
  },
}
