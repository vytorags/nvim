return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    event = { 'BufReadPre', 'BufNewFile' },
    build = require('nixCatsUtils').lazyAdd ':TSUpdate',
    dependencies = {
      'tree-sitter/tree-sitter-embedded-template',
    },
    config = function()
      local treesitter = require 'nvim-treesitter'
      treesitter.install {
        'c',
        'lua',
        'css',
        'html',
        'cpp',
        'javascript',
        'rust',
        'java',
        'sql',
        'nix',
        'markdown',
        'json',
        'yaml',
        'python',
        'go',
        'php',
        'vue',
      }
      treesitter.setup {
        sync_install = false,
        ignore_install = {},
        auto_install = require('nixCatsUtils').lazyAdd(true, false),

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
          disable = function(lang, buf)
            local max_filesize = 500 * 1024
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
        },

        indent = {
          enable = true,
        },

        fold = {
          enable = true,
        },

        playground = {
          enable = false,
        },
        modules = {},
      }
      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          local buf, filetype = args.buf, args.match

          local language = vim.treesitter.language.get_lang(filetype)
          if not language then
            return
          end

          if not vim.treesitter.language.add(language) then
            return
          end
          vim.treesitter.start(buf, language)
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
