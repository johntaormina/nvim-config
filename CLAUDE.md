# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a personal Neovim configuration built with Lua and the Lazy.nvim plugin manager. The configuration follows a modular structure with separate files for different plugin categories and settings.

## Architecture

### Directory Structure
- `init.lua` - Entry point that loads the main configuration module
- `lua/jt/` - Main configuration namespace
  - `init.lua` - Loads core modules (set, remap, lazyinit)
  - `set.lua` - Neovim options and settings
  - `remap.lua` - Key mappings and shortcuts
  - `lazyinit.lua` - Lazy.nvim plugin manager setup
  - `plugins/` - Individual plugin configurations

### Plugin Management
Uses Lazy.nvim for plugin management. Plugins are loaded from the `lua/jt/plugins/` directory with automatic discovery via `spec = "jt.plugins"` in `lazyinit.lua:15`.

### Key Plugin Categories
- **LSP**: Language server configuration with Mason for automatic installation
- **Completion**: nvim-cmp with LSP, buffer, and snippet sources
- **Navigation**: Telescope for fuzzy finding, Harpoon for quick file switching
- **UI**: Airline statusline, Iceberg colorscheme, Zen Mode
- **Git**: Fugitive for Git integration
- **Editing**: Comment.nvim, nvim-surround, nvim-spectre for search/replace

## Key Mappings

Leader key is space (`<leader> = " "`).

### Essential Mappings
- `<leader>ff` - Find files (Telescope)
- `<leader>fg` - Live grep (Telescope) 
- `<leader>a` - Add file to Harpoon
- `<C-e>` - Toggle Harpoon quick menu
- `<leader>cfg` - Open config folder
- `<leader>f` - Format with LSP

### Navigation
- `-` - Open parent directory (netrw)
- `jk` / `jj` - Escape from insert mode
- `<C-h/t/n/s>` - Harpoon file selection (slots 1-4)

## Development Commands

### Plugin Management
- `:Lazy` - Open Lazy.nvim interface for plugin management
- `:Lazy update` - Update all plugins
- `:Lazy sync` - Sync plugins (install missing, update existing)

### LSP Management
- `:Mason` - Open Mason LSP installer interface
- `:LspInfo` - Show LSP client information
- `:LspRestart` - Restart LSP clients

### Configuration Editing
The configuration includes shortcuts to quickly edit config files:
- `<leader>cfg` - Opens config directory in current window
- `<leader>vfg` - Opens config directory in vertical split

## Language Server Configuration

LSP is configured via Mason with automatic installation for:
- `lua_ls` - Lua language server
- `rust_analyzer` - Rust language server  
- `ts_ls` - TypeScript language server

Lua LSP is configured to recognize Neovim globals (`vim`, test globals).

## Code Formatting

Conform.nvim handles code formatting. Format on save can be triggered with `<leader>f` or automatically configured per filetype.

## File Type Specific Settings

CSS files use 2-space indentation (configured in `set.lua:34-41`).