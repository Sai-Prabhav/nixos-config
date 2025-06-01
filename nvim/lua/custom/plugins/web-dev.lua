return {
  -- JSON support
  {
    'b0o/schemastore.nvim',
    ft = { 'json', 'jsonc' },
    config = function()
      require('lspconfig').jsonls.setup {
        settings = {
          json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
          },
        },
      }
    end,
  },

  -- Markdown support
  {
    'preservim/vim-markdown',
    ft = { 'markdown' },
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
    end,
  },

  -- Prettier and Prettierd for formatting
  {
    'prettier/vim-prettier',
    run = 'yarn install',
    ft = { 'javascript', 'typescript', 'css', 'html', 'json', 'markdown' },
    cmd = { 'Prettier', 'PrettierAsync' },
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local null_ls = require('null-ls')
      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.prettierd,
        },
      }
    end,
  },

  -- Tailwind CSS support
  {
    'tailwindlabs/tailwindcss-intellisense.nvim',
    ft = { 'html', 'css', 'javascript', 'typescript' },
    config = function()
      require('lspconfig').tailwindcss.setup {}
    end,
  },

  -- CSS and HTML support
  {
    'mattn/emmet-vim',
    ft = { 'html', 'css', 'javascript', 'typescript' },
    config = function()
      vim.g.user_emmet_leader_key = '<C-Z>'
    end,
  },
}