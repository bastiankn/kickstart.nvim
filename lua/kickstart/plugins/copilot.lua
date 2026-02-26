return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim', branch = 'master' },
    },
    build = 'make tiktoken', -- Optional: for accurate token counting
    opts = {
      -- model = 'claude-3.5-sonnet', -- Can also use 'gpt-4o', 'o1-mini', etc.
      temperature = 0.1, -- Lower = focused, higher = creative
      window = {
        layout = 'vertical', -- 'vertical', 'horizontal', 'float'
        width = 0.4, -- 40% of screen width
      },
      auto_insert_mode = true, -- Enter insert mode when opening
    },
    -- Float window config (for floating layout)
    float_window = {
      layout = 'float',
      relative = 'editor',
      width = 80,
      height = 30,
      border = 'rounded',
    },
    keys = {
      -- Quick chat
      {
        '<leader>cc',
        function()
          local input = vim.fn.input 'Quick Chat: '
          if input ~= '' then
            require('CopilotChat').ask(input, { selection = require('CopilotChat.select').buffer })
          end
        end,
        desc = '[C]opilot Quick [C]hat',
        mode = { 'n', 'v' },
      },
      -- Toggle chat window
      { '<leader>ct', '<cmd>CopilotChatToggle<cr>', desc = '[C]opilot Chat [T]oggle', mode = { 'n', 'v' } },
      -- Toggle floating chat window
      {
        '<leader>c<space>',
        function()
          local width = math.floor(vim.o.columns * 0.8)
          local height = math.floor(vim.o.lines * 0.8)
          require('CopilotChat').toggle {
            window = {
              layout = 'float',
              relative = 'editor',
              width = width,
              height = height,
              border = 'rounded',
            },
          }
        end,
        desc = '[C]opilot Chat [F]loat window',
        mode = { 'n', 'v' },
      },
      -- Predefined prompts
      { '<leader>ce', '<cmd>CopilotChatExplain<cr>', desc = '[C]opilot [E]xplain code', mode = { 'n', 'v' } },
      { '<leader>cr', '<cmd>CopilotChatReview<cr>', desc = '[C]opilot [R]eview code', mode = { 'n', 'v' } },
      { '<leader>cf', '<cmd>CopilotChatFix<cr>', desc = '[C]opilot [F]ix code', mode = { 'n', 'v' } },
      { '<leader>co', '<cmd>CopilotChatOptimize<cr>', desc = '[C]opilot [O]ptimize code', mode = { 'n', 'v' } },
      { '<leader>cd', '<cmd>CopilotChatDocs<cr>', desc = '[C]opilot Generate [D]ocs', mode = { 'n', 'v' } },
      { '<leader>cT', '<cmd>CopilotChatTests<cr>', desc = '[C]opilot Generate [T]ests', mode = { 'n', 'v' } },
      -- Show available models
      { '<leader>cm', '<cmd>CopilotChatModels<cr>', desc = '[C]opilot Show [M]odels' },
    },
    config = function(_, opts)
      require('CopilotChat').setup(opts)

      -- Auto-command to customize chat buffer appearance
      vim.api.nvim_create_autocmd('BufEnter', {
        pattern = 'copilot-*',
        callback = function()
          vim.opt_local.relativenumber = false
          vim.opt_local.number = false
        end,
      })
    end,
  },
}