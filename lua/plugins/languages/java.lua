local function on_language_status(_, result)
  -- Ignore nil messages.
  if result.message == nil then
    return
  end
  local command = vim.api.nvim_command
  command 'echohl ModeMsg'
  command(string.format('echo "%s"', result.message))
  command 'echohl None'
end

return {
  -- {
  -- 'williamboman/mason-lspconfig.nvim',
  -- opts = function(_, opts)
  -- lspconfig.jdtls.setup {
  --   handlers = {
  --     ["$/progress"] = vim.schedule_wrap(on_language_status),
  --   },
  -- }
  -- lspconfig.java_language_server.setup {
  --   cmd = {"java-language-server"},
  -- }
  --   end,
  -- },
  {
    'nvim-java/nvim-java',
    lazy = true,
    ft = 'java',
    dependencies = {
      'nvim-java/lua-async-await',
      'nvim-java/nvim-java-core',
      'nvim-java/nvim-java-test',
      'nvim-java/nvim-java-dap',
      'MunifTanjim/nui.nvim',
      'neovim/nvim-lspconfig',
      'mfussenegger/nvim-dap',
      'nvim-java/nvim-java-refactor',
      {
        'williamboman/mason.nvim',
        opts = function(_, opts)
          opts.registries = {
            'github:nvim-java/mason-registry',
            'github:mason-org/mason-registry',
          }
        end,
      },
    },
    config = function()
      require('java').setup {
        settings = {
          java = {
            inlayHints = {
              parameterNames = {
                enabled = 'all',
                exclusions = { 'this' },
              },
            },
          },
        },
      }
      -- require('lspconfig').jdtls.setup()
    end,
  },
}
