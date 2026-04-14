vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.inlayHintProvider then
      -- Enable inlay hints using native API
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
})

local function set_inlay_hint_highlight()
  local comment_hl = vim.api.nvim_get_hl(0, { name = 'Comment', link = false })
  local normal_hl = vim.api.nvim_get_hl(0, { name = 'Normal', link = false })

  vim.api.nvim_set_hl(0, 'LspInlayHint', {
    fg = comment_hl.fg and string.format('#%06x', comment_hl.fg) or nil,
    bg = normal_hl.bg and string.format('#%06x', normal_hl.bg) or nil,
    italic = true,
  })
end

set_inlay_hint_highlight()

vim.api.nvim_create_autocmd('ColorScheme', {
  callback = set_inlay_hint_highlight,
})

vim.keymap.set('n', '<leader>ih', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = 'Toggle Inlay Hints globally' })
