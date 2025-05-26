return {
  {
    'jay-babu/mason-nvim-dap.nvim',
    lazy = true,
    opts = {
      ensure_installed = { 'codelldb', 'delve', 'javadbg', 'javatest', 'python', 'js' },
      handlers = {
        function(config)
          -- all sources with no handler get passed here

          -- Keep original functionality
          require('mason-nvim-dap').default_setup(config)
        end,
        python = function() end,
      },
    },
  },
  {
    'williamboman/mason.nvim',
    lazy = true,
    event = 'UIEnter',
    opts = function(_, opts)
      opts.ui = {
        icons = {
          package_installed = ' ',
          package_pending = '󰦗 ',
          package_uninstalled = ' ',
        },
      }
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',
    },
    -- dependencies = { "VonHeikemen/lsp-zero.nvim" },
    lazy = true,
    event = 'BufRead',
    opts = function(_, opts)
      local lsp_zero = require 'lsp-zero'

      opts.ensure_installed = {
        'jsonls',
        'clangd',
        'gopls',
        'jdtls',
        'lemminx',
        'lua_ls',
        'pyright',
        -- 'typst_lsp',
        "tinymist",
        'taplo',
        'tailwindcss',
        'html',
        'cssls',
        'yamlls',
        -- 'vtsls',
        'eslint',
        'svelte',
        -- 'biome',
      }
      opts.handlers = {
        function(server_name)
          require('lspconfig')[server_name].setup {}
        end,
        clangd = function()
          require('lspconfig').clangd.setup {
            capabilities = {
              offsetEncoding = 'utf-8',
            },
          }
        end,
        rust_analyzer = lsp_zero.noop,
        pyright = function()
          require('lspconfig').pyright.setup {
            before_init = function(_, c)
              c.settings.python.pythonPath = vim.fn.exepath 'python'
            end,
          }
        end,
        lua_ls = function()
          require('lspconfig').lua_ls.setup {
            settings = { Lua = { hint = { enable = true, arrayIndex = 'Disable' } } },
          }
        end,
        jdtls = function()
          require('lspconfig').jdtls.setup {
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
        end,
        tinymist = function()
          require('lspconfig').tinymist.setup {
            root_dir = function(filename, bufnr)
              return vim.fn.getcwd()
            end,
            -- settings = {
            --   tinymist = {
            --     formatterMode = "typstyle",
            --   }
            -- }
          }
        end,

        intelephense = function()
          require("lspconfig").intelephense.setup({
            root_dir = function()
              return vim.fn.getcwd()
            end
          })
        end,

        -- vtsls = function()
        --   require('lspconfig.configs').vtsls = require('vtsls').lspconfig
        --   settings = {
        --     typescript = {
        --       updateImportsOnFileMove = { enabled = 'always' },
        --       inlayHints = {
        --         parameterNames = { enabled = 'all' },
        --         parameterTypes = { enabled = true },
        --         variableTypes = { enabled = true },
        --         propertyDeclarationTypes = { enabled = true },
        --         functionLikeReturnTypes = { enabled = true },
        --         enumMemberValues = { enabled = true },
        --       },
        --     },
        --     javascript = {
        --       updateImportsOnFileMove = { enabled = 'always' },
        --       inlayHints = {
        --         parameterNames = { enabled = 'literals' },
        --         parameterTypes = { enabled = true },
        --         variableTypes = { enabled = true },
        --         propertyDeclarationTypes = { enabled = true },
        --         functionLikeReturnTypes = { enabled = true },
        --         enumMemberValues = { enabled = true },
        --       },
        --     },
        --     vtsls = {
        --       enableMoveToFileCodeAction = true,
        --     },
        --   },
        -- }
        -- end,
        gopls = function()
          require('lspconfig').gopls.setup {
            settings = {
              gopls = {
                analyses = {
                  ST1003 = true,
                  fieldalignment = false,
                  fillreturns = true,
                  nilness = true,
                  nonewvars = true,
                  shadow = true,
                  undeclaredname = true,
                  unreachable = true,
                  unusedparams = true,
                  unusedwrite = true,
                  useany = true,
                },
                codelenses = {
                  gc_details = true, -- Show a code lens toggling the display of gc's choices.
                  generate = true,   -- show the `go generate` lens.
                  regenerate_cgo = true,
                  test = true,
                  tidy = true,
                  upgrade_dependency = true,
                  vendor = true,
                },
                hints = {
                  assignVariableTypes = true,
                  compositeLiteralFields = true,
                  compositeLiteralTypes = true,
                  constantValues = true,
                  functionTypeParameters = true,
                  parameterNames = true,
                  rangeVariableTypes = true,
                },
                buildFlags = { '-tags', 'integration' },
                completeUnimported = true,
                diagnosticsDelay = '500ms',
                matcher = 'Fuzzy',
                semanticTokens = true,
                staticcheck = true,
                symbolMatcher = 'fuzzy',
                usePlaceholders = true,
              },
            },
          }
        end,
        jsonls = function()
          require('lspconfig').jsonls.setup {
            schemas = require('schemastore').json.schemas(),
            settings = { json = { validate = { enable = true } }, yaml = { schemaStore = { enable = false, url = '' } } },
          }
        end,
        svelte = function()
          require('lspconfig').svelte.setup {
            settings = {
              typescript = {
                inlayHints = {
                  parameterNames = { enabled = 'all' },
                  parameterTypes = { enabled = true },
                  variableTypes = { enabled = true },
                  propertyDeclarationTypes = { enabled = true },
                  functionLikeReturnTypes = { enabled = true },
                  enumMemberValues = { enabled = true },
                },
              },
            },
          }
        end,
      }
    end,
  },
  {
    'jay-babu/mason-null-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason.nvim',
      'nvimtools/none-ls.nvim',
    },
    opts = function(_, opts)
      opts.ensure_installed = { 'prettierd', 'gomodifytags', 'gofumpt', 'iferr', 'impl', 'goimports', 'clang_format',
        'black', 'isort' }
      opts.handlers = {
        checkstyle = function()
          local null_ls = require 'null-ls'
          null_ls.register(null_ls.builtins.diagnostics.checkstyle.with {
            extra_args = { '-c', 'google_checks.xml' },
          })
        end,
      }
      -- require 'your.null-ls.config' -- require your null-ls config here (example below)
    end,
  },
}
