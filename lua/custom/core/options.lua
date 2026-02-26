-- [[ Leader Key]]
-- Set <space> as the leader key
-- See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ UI & Display ]]
-- Set to true if you have a Nerd Font installed and selected in the terminal
-- Will use fallback icons if false
vim.g.have_nerd_font = false

-- Make line numbers default
vim.o.number = true
-- relative line numbers default remove below
-- vim.o.relativenumber = true

-- Enable mouse mode, useful for resizing, splits, etc.
-- See `:help 'mouse'` 
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  See `:help 'clipboard'`
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

-- [[ Editing Behavior ]]
-- Enable break indent
vim.o.breakindent = true

-- Save undo history - even after closing the editor
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- [[ Window Split ]]
-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- [[ Visual Helper ]]
-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-guide-options`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Keep x lines visible when scrolling vertically
vim.o.scrolloff = 10

-- Show save dialog instead of errors when trying to quit with unsaved changes
-- See `:help 'confirm'`
vim.o.confirm = true

-- [[ Diagnostic Config ]]
-- See :help vim.diagnostic.Opts
vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = vim.diagnostic.severity.ERROR },

  -- Can switch between these as you prefer
  virtual_text = true, -- Text shows up at the end of the line
  virtual_lines = false, -- Text shows up underneath the line, with virtual lines

  -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
  jump = { float = true },
}