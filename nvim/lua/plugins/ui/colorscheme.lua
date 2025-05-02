-- Colorscheme configuration

return {
  {
    'vague2k/vague.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('vague').setup {
        styles = {
          comments = { italic = false }, -- Disable italics in comments
        },
      }
      
      -- Set the colorscheme
      vim.cmd.colorscheme('vague')
    end,
  },
  
  -- You can add more colorscheme plugins here
  -- Example:
  -- {
  --   'folke/tokyonight.nvim',
  --   lazy = true,
  --   opts = { style = 'moon' },
  -- },
}