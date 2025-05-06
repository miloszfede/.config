-- Plugin management with lazy.nvim

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Configure lazy.nvim
require('lazy').setup({
  -- Load plugins from the /lua/plugins directory
  { import = 'plugins.ui' },
  { import = 'plugins.editor' },
  { import = 'plugins.lsp' },
  { import = 'plugins.treesitter' },
  { import = 'plugins.tools' },
  { import = 'plugins.completion' },
}, {
  ui = {
    -- If you have a Nerd Font, set to true
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
  checker = {
    -- automatically check for plugin updates
    enabled = true,
    frequency = 86400, -- check for updates once a day
  },
  change_detection = {
    -- automatically check for config file changes and reload
    enabled = true,
    notify = false, -- don't show notification when config changes
  },
})
