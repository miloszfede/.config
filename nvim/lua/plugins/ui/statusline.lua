-- Statusline configuration

return {
  {
    'echasnovski/mini.nvim',
    event = 'VeryLazy',
    config = function()
      -- Simple and easy statusline
      local statusline = require('mini.statusline')
      statusline.setup { 
        use_icons = vim.g.have_nerd_font 
      }

      -- Custom statusline format to show line:column
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
  },
  
  -- You can replace mini.statusline with another statusline plugin here
  -- Examples:
  -- { 'nvim-lualine/lualine.nvim', opts = { /* your config */ } },
  -- { 'hoob3rt/lualine.nvim', opts = { /* your config */ } },
}