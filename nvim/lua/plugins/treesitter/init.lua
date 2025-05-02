-- Treesitter configuration
return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
      },
      -- Automatically install missing parsers when entering buffer
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system for indent rules
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { 
        enable = true,
        disable = { 'ruby' },
      },
      -- Uncomment to enable incremental selection
      -- incremental_selection = {
      --   enable = true,
      --   keymaps = {
      --     init_selection = '<c-space>',
      --     node_incremental = '<c-space>',
      --     scope_incremental = '<c-s>',
      --     node_decremental = '<M-space>',
      --   },
      -- },
    },
  },
}