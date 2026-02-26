# Neovim Plugins Overview

This document describes all plugins configured in this Neovim setup, their purpose, and key features.

## Core Functionality

### Telescope (`telescope.lua`)
**Plugin:** `nvim-telescope/telescope.nvim`

Fuzzy finder for files, text, LSP symbols, and more. The primary way to search and navigate your workspace.

**Key Mappings:**
- `<leader>sh` - Search help tags
- `<leader>sk` - Search keymaps
- `<leader>sf` - Search files
- `<leader>sg` - Live grep (search text in files)
- `<leader>sw` - Search word under cursor
- `<leader>sd` - Search diagnostics
- `<leader>sr` - Resume last search
- `<leader>s.` - Search recent files
- `<leader>sc` - Search commands
- `<leader><leader>` - Find existing buffers

**LSP Mappings (when LSP is active):**
- `grr` - Find references
- `gri` - Find implementations

---

### LSP (`lsp.lua`)
**Plugin:** `neovim/nvim-lspconfig` + `mason.nvim`

Language Server Protocol configuration providing code intelligence features like go-to-definition, autocompletion, error checking, and more.

**Key Mappings:**
- `grn` - Rename symbol
- `gra` - Code action
- `grD` - Go to declaration
- Automatic highlighting of symbol references under cursor

**Features:**
- Automatic LSP server installation via Mason
- Status updates via fidget.nvim
- Document highlight on cursor hold

---

### Autocomplete (`autocomplete.lua`)
**Plugin:** `saghen/blink.cmp` + `L3MON4D3/LuaSnip`

Intelligent autocompletion with snippet support.

**Key Mappings:**
- `<c-y>` - Accept completion
- `<tab>/<s-tab>` - Navigate snippet fields
- `<c-space>` - Open menu or docs
- `<c-n>/<c-p>` or `<up>/<down>` - Select items
- `<c-e>` - Hide menu
- `<c-k>` - Toggle signature help

**Features:**
- LSP-based completions
- Path completions
- Snippet expansion
- Signature help while typing function arguments

---

### Treesitter (`treesitter.lua`)
**Plugin:** `nvim-treesitter/nvim-treesitter`

Advanced syntax highlighting and code parsing using tree-sitter parsers.

**Supported Languages:**
- bash, C, HTML, Lua, Markdown, Python, Rust, Vim, and more

**Features:**
- Better syntax highlighting than regex-based systems
- Code structure understanding for better navigation

---

## Editor Enhancements

### Guess Indent (`editor.lua`)
**Plugin:** `NMAC427/guess-indent.nvim`

Automatically detects and sets indentation (tabs vs spaces, indent width) based on file content.

---

### 🔗 Auto Pairs (`autopairs.lua`)
**Plugin:** `windwp/nvim-autopairs`

Automatically closes brackets, quotes, and other paired characters.

**Features:**
- Auto-closes `()`, `[]`, `{}`, `""`, `''`, etc.
- Works in insert mode

---

### Indent Guides (`indent_line.lua`)
**Plugin:** `lukas-reineke/indent-blankline.nvim`

Shows vertical lines for indentation levels, making code structure easier to see.

---

## UI & Visual

### Which-Key (`ui.lua`)
**Plugin:** `folke/which-key.nvim`

Shows popup with available keybindings when you pause while typing a command.

**Features:**
- Instant delay (0ms) for quick reference
- Organized key groups for `<leader>s` (Search), `<leader>t` (Toggle), `<leader>h` (Git Hunk)

---

### Tokyo Night Theme (`ui.lua`)
**Plugin:** `folke/tokyonight.nvim`

Dark colorscheme with the "tokyonight-night" variant active.

---

### Todo Comments (`ui.lua`)
**Plugin:** `folke/todo-comments.nvim`

Highlights TODO, FIXME, NOTE, HACK, WARNING, and similar comments in your code.

---

### Mini Plugins (`ui.lua`)
**Plugin:** `nvim-mini/mini.nvim`

Collection of small, independent plugins:

**mini.ai** - Better text objects:
- `va)` - Select around parentheses
- `yinq` - Yank inside next quote
- `ci'` - Change inside quotes

**mini.surround** - Add/delete/replace surroundings:
- `saiw)` - Surround word with parentheses
- `sd'` - Delete surrounding quotes
- `sr)'` - Replace parentheses with quotes

**mini.statusline** - Minimal status line at bottom of screen

---

### Neo-Tree (`neo-tree.lua`)
**Plugin:** `nvim-neo-tree/neo-tree.nvim`

File explorer sidebar for browsing and managing files.

**Key Mappings:**
- `\` - Toggle file explorer (reveal current file)

---

## Version Control

### Git Signs (`gitsigns.lua`)
**Plugin:** `lewis6991/gitsigns.nvim`

Git integration showing changes in the gutter and providing git operations.

**Navigation:**
- `]c` - Jump to next git change
- `[c` - Jump to previous git change

**Actions:**
- `<leader>hs` - Stage hunk
- `<leader>hr` - Reset hunk
- `<leader>hS` - Stage entire buffer
- `<leader>hR` - Reset entire buffer
- `<leader>hp` - Preview hunk
- `<leader>hb` - Show blame for line
- `<leader>hd` - Diff against index
- `<leader>hD` - Diff against last commit

**Toggles:**
- `<leader>tb` - Toggle inline blame
- `<leader>tD` - Toggle show deleted lines

**Signs:**
- `+` - Added lines
- `~` - Changed lines
- `_` - Deleted lines

---

## Code Quality

### Linting (`lint.lua`)
**Plugin:** `mfussenegger/nvim-lint`

Provides linting support beyond what LSP offers.

**Configured Linters:**
- Markdown: `markdownlint`

**Features:**
- Runs automatically on buffer enter, save, and leaving insert mode
- Only lints modifiable buffers

---

## Debugging

### DAP Debugger (`debug.lua`)
**Plugins:** `mfussenegger/nvim-dap` + `rcarriga/nvim-dap-ui`

Debug Adapter Protocol for debugging code (primarily configured for Go).

**Key Mappings:**
- `<F5>` - Start/Continue debugging
- `<F1>` - Step into
- `<F2>` - Step over
- `<F3>` - Step out
- `<F7>` - Toggle debug UI
- `<leader>b` - Toggle breakpoint
- `<leader>B` - Set conditional breakpoint

**Features:**
- Beautiful debug UI
- Automatic debug adapter installation via Mason
- Configured for Go (`delve` debugger)
- Extensible for other languages

---

## Plugin Manager

This configuration uses **lazy.nvim** as the plugin manager, which:
- Lazy-loads plugins for fast startup
- Automatically installs plugins on first run
- Provides `:Lazy` command to manage plugins
- Updates plugins with `:Lazy update`

---

## Adding More Plugins

To add your own plugins, create files in `lua/custom/plugins/` - they will be automatically loaded via the `{ import = 'custom.plugins' }` line in `init.lua`.
