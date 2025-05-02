-- LSP server configurations

local servers = {
  -- lua_ls configuration
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
        -- Uncomment to disable noisy warnings
        -- diagnostics = { disable = { 'missing-fields' } },
      },
    },
  },

  -- Add more language servers here
  -- Examples:
  -- pyright = {},
  -- tsserver = {},
  -- rust_analyzer = {},
}

-- Setup for Mason-LSPConfig
return {
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      'neovim/nvim-lspconfig',
      'saghen/blink.cmp',
    },
    config = function()
      -- Get LSP capabilities from blink.cmp
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- Ensure necessary tools are installed
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format Lua code
      })
      
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      -- Configure mason-lspconfig
      require('mason-lspconfig').setup {
        ensure_installed = {}, -- Handled by mason-tool-installer
        automatic_installation = false,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- Add capabilities to server configuration
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  }
}