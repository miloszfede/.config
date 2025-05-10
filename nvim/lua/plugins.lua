local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "bluz71/vim-moonfly-colors",
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = 'default' },

      appearance = {
        nerd_font_variant = 'mono'
      },
      completion = { documentation = { auto_show = false } },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  },
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",

  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup {}
    end,
  },

  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "lua", "python", "javascript" }, -- Add languages you want
        highlight = {
          enable = true,              -- false will disable the whole extension
          additional_vim_regex_highlighting = false,
        },
      }
    end,
  },
  {
    'OmniSharp/omnisharp-vim',
    config = function()
      vim.g.OmniSharp_popup_position = 'peek'
      vim.g.OmniSharp_popup_options = {
        winblend = 30,
        winhl = 'Normal:Normal,FloatBorder:ModeMsg',
        border = 'rounded',
      }
      vim.g.OmniSharp_popup_mappings = {
        sigNext = '<C-n>',
        sigPrev = '<C-p>',
        pageDown = { '<C-f>', '<PageDown>' },
        pageUp = { '<C-b>', '<PageUp>' },
      }
    end,
  },
  {
    'dense-analysis/ale',
    config = function()
      vim.g.ale_linters = { cs = { 'OmniSharp' } }
      vim.g.ale_sign_error = '•'
      vim.g.ale_sign_warning = '•'
      vim.g.ale_sign_info = '·'
    end,
  },
  {
    'prabirshrestha/asyncomplete.vim',
    config = function()
      vim.g.asyncomplete_auto_popup = 1
      vim.g.asyncomplete_auto_completeopt = 0
    end,
  },
})
