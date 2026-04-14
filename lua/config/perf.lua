vim.loader.enable()

local builtins = {
  'netrw',
  'netrwPlugin',
  'gzip',
  'tar',
  'tarPlugin',
  'zip',
  'zipPlugin',
  'matchit',
  'matchparen',
}

for _, plugin in ipairs(builtins) do
  vim.g['loaded_' .. plugin] = 1
end
