# Neovim Configuration

A modular Neovim configuration focused on being maintainable, organized, and understandable.

## Structure

```
~/.config/nvim/
├── init.lua                  # Main entry point
├── lua/
│   ├── core/                 # Core configuration
│   │   ├── options.lua       # Vim options
│   │   ├── keymaps.lua       # Key mappings
│   │   ├── autocmds.lua      # Autocommands
│   │   └── init.lua          # Core module loader
│   │
│   ├── plugins/              # Plugin configurations
│   │   ├── init.lua          # Plugin manager setup (lazy.nvim)
│   │   ├── ui/               # UI related plugins
│   │   │   ├── colorscheme.lua
│   │   │   ├── statusline.lua
│   │   │   └── file-explorer.lua
│   │   ├── editor/           # Editor enhancements
│   │   ├── lsp/              # LSP configurations
│   │   │   ├── init.lua
│   │   │   └── servers/      # Server-specific configs
│   │   ├── treesitter/       # Treesitter configuration
│   │   ├── tools/            # Development tools
│   │   └── completion/       # Completion related
│   │
│   └── utils/                # Utility functions
│
├── .stylua.toml
└── README.md
```

## Features

- Modular architecture for easy maintenance
- Fast startup with lazy-loading when possible
- LSP (Language Server Protocol) integration
- Treesitter for better syntax highlighting
- Telescope for fuzzy finding
- Git integration with Gitsigns
- Completion with Blink.cmp
- Statusline with mini.statusline
- File navigation with nvim-tree

## Customizing

Add your own plugins by creating files in the appropriate category folder.
For example, to add a new UI plugin, create a file in `lua/plugins/ui/` that returns a plugin spec.

## Key Mappings

See `lua/core/keymaps.lua` for core keymaps and individual plugin configuration files for plugin-specific keymaps.

The leader key is set to `Space`.