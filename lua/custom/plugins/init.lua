-- Custom Python development plugins
return {
  -- Custom LSP: Astral ty for Python
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'williamboman/mason-lspconfig.nvim' },
    config = function()
      local lspconfig = require 'lspconfig'
      local configs = require 'lspconfig.configs'

      -- Define ty LSP if not already defined
      if not configs.ty then
        configs.ty = {
          default_config = {
            cmd = { 'ty', 'server' },
            filetypes = { 'python' },
            root_dir = function(fname)
              return lspconfig.util.root_pattern('pyproject.toml', '.git')(fname) or vim.loop.cwd()
            end,
            settings = {},
          },
        }
      end

      -- Setup ty LSP
      lspconfig.ty.setup {}
    end,
  },

  -- none-ls for Ruff linting and formatting
  {
    'nvimtools/none-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local null_ls = require 'null-ls'
      null_ls.setup {
        sources = {
          -- Use ruff_format and ruff for none-ls
          null_ls.builtins.formatting.ruff_format,
          null_ls.builtins.diagnostics.ruff,
        },
      }
    end,
  },

  -- DAP for Python debugging with debugpy
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require 'dap'
      dap.adapters.python = {
        type = 'executable',
        command = 'python',
        args = { '-m', 'debugpy.adapter' },
      }
      dap.configurations.python = {
        {
          type = 'python',
          request = 'launch',
          name = 'Launch file',
          program = '${file}',
          pythonPath = function()
            return 'python'
          end,
        },
      }
    end,
  },

  -- DAP UI for better debugging experience
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    config = function()
      require('dapui').setup()
    end,
  },
}
