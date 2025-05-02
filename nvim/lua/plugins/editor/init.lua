-- Editor enhancements
return {
  -- Detect indentation
  { 'tpope/vim-sleuth' },
  
  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      signs = false,
    },
  },
  
  -- Mini plugins for text objects and more
  {
    'echasnovski/mini.nvim',
    event = 'VeryLazy',
    config = function()
      -- Text objects for easily selecting content
      require('mini.ai').setup { n_lines = 500 }
      
      -- Surround text with quotes, brackets, etc.
      require('mini.surround').setup()
    end,
  },
  
  -- Autoformatting
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable format_on_save for certain filetypes
        local disable_filetypes = { c = true, cpp = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 500,
            lsp_format = 'fallback',
          }
        end
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Add more formatters as needed
        -- python = { "isort", "black" },
        -- javascript = { "prettierd", "prettier" },
      },
    },
  },
}