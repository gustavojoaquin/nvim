-- if true then return {} end
return {
  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = { 'aznhe21/actions-preview.nvim' },
    lazy = true,
    event = 'BufRead',
    branch = 'v3.x',
    opts = function(_, opts)
      local lsp_zero = require 'lsp-zero'

      lsp_zero.extend_lspconfig()
      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps { buffer = bufnr, preserve_mappings = false }

        vim.keymap.set('n', '<leader>lD', vim.lsp.buf.declaration, { desc = 'Go to declaration', buffer = bufnr })
        vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, { desc = 'Go to definition', buffer = bufnr })
        vim.keymap.set('n', '<leader>lm', vim.lsp.buf.implementation, { desc = 'Go to implementation', buffer = bufnr })
        vim.keymap.set('n', '<leader><C-k>', vim.lsp.buf.signature_help, { desc = 'Signature help', buffer = bufnr })
        vim.keymap.set('n', '<leader>lw', vim.lsp.buf.add_workspace_folder,
          { desc = 'Add workspace folder', buffer = bufnr })
        vim.keymap.set('n', '<leader>lr', vim.lsp.buf.remove_workspace_folder,
          { desc = 'Remove workspace folder', buffer = bufnr })
        vim.keymap.set('n', '<leader>ll', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, { desc = 'List workspace folder', buffer = bufnr })
        vim.keymap.set('n', '<leader>lt', vim.lsp.buf.type_definition, { desc = 'Type definition', buffer = bufnr })
        vim.keymap.set('n', '<leader>ln', vim.lsp.buf.rename, { desc = 'Rename', buffer = bufnr })
        vim.keymap.set({ 'n', 'v' }, '<leader>la', function()
          require('actions-preview').code_actions()
        end, { desc = 'LSP code actions', buffer = bufnr })
        vim.keymap.set('n', '<leader>ls', vim.lsp.buf.references, { desc = 'References', buffer = bufnr })
        vim.keymap.set('n', '<space>lf', function()
          vim.lsp.buf.format { async = true }
        end, { desc = 'Format', buffer = bufnr })
      end)
      lsp_zero.set_sign_icons {
        error = ' ',
        warn = ' ',
        hint = ' ',
        info = ' ',
      }
    end,
  },
}
