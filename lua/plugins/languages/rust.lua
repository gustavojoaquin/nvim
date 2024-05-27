-- if true then return {} end
return {
  {
    'mrcjkb/rustaceanvim',
    dependencies = { 'adaszko/tree_climber_rust.nvim', lazy = true },
    lazy = true,
    -- version = "^4",
    ft = 'rust',
    config = function()
      local lsp_zero = require 'lsp-zero'
      local server = {
        default_settings = {
          -- rust-analyzer language server configuration
          ['rust-analyzer'] = {
            checkOnSave = {
              command = 'clippy',
            },
            assist = {
              importEnforceGranularity = true,
              importPrefix = 'crate',
            },
            completion = {
              postfix = {
                enable = false,
              },
            },
            -- inlayHints = {
            --   lifetimeElisionHints = {
            --     enable = true,
            --     useParamuterNames = true,
            --   },
            -- },
            inlayHints = {
              bindingModeHints = {
                enable = false,
              },
              chainingHints = {
                enable = true,
              },
              closingBraceHints = {
                enable = true,
                minLines = 25,
              },
              closureReturnTypeHints = {
                enable = 'never',
              },
              lifetimeElisionHints = {
                enable = 'never',
                useParameterNames = false,
              },
              maxLength = 25,
              parameterHints = {
                enable = true,
              },
              reborrowHints = {
                enable = 'never',
              },
              renderColons = true,
              typeHints = {
                enable = true,
                hideClosureInitialization = false,
                hideNamedConstructor = false,
              },
            },
          },
        },
        on_attach = function(client, bufnr)
          local opts = { noremap = true, silent = true }
          vim.api.nvim_buf_set_keymap(bufnr, 'n', 's', '<cmd>lua require("tree_climber_rust").init_selection()<CR>', opts)
          vim.api.nvim_buf_set_keymap(bufnr, 'x', 's', '<cmd>lua require("tree_climber_rust").select_incremental()<CR>',
            opts)
          vim.api.nvim_buf_set_keymap(bufnr, 'x', 'S', '<cmd>lua require("tree_climber_rust").select_previous()<CR>',
            opts)
        end,
        capabilities = lsp_zero.get_capabilities(),
      }
      local dap = function()
        local adapter
        -- Update this path
        local success, package = pcall(function()
          return require('mason-registry').get_package 'codelldb'
        end)
        local cfg = require 'rustaceanvim.config'
        if success then
          local package_path = package:get_install_path()
          local codelldb_path = package_path .. '/codelldb'
          local liblldb_path = package_path .. '/extension/lldb/lib/liblldb'
          local this_os = vim.loop.os_uname().sysname

          -- The path is different on Windows
          if this_os:find 'Windows' then
            codelldb_path = package_path .. '\\extension\\adapter\\codelldb.exe'
            liblldb_path = package_path .. '\\extension\\lldb\\bin\\liblldb.dll'
          else
            -- The liblldb extension is .so for Linux and .dylib for MacOS
            liblldb_path = liblldb_path .. (this_os == 'Linux' and '.so' or '.dylib')
          end
          adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path)
        else
          adapter = cfg.get_codelldb_adapter()
        end
        return {
          adapter,
        }
      end
      vim.g.rustaceanvim = {
        server,
        dap,
      }
    end,
  },
  {
    'Saecki/crates.nvim',
    --dependencies = "hrsh7th/nvim-cmp",
    lazy = true,
    event = { 'BufRead Cargo.toml' },
    dependencies = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      local opts = {}
      local crates = require 'crates'
      local cmp = require 'cmp'
      local wk = require 'which-key'

      vim.api.nvim_create_autocmd('BufRead', {
        group = vim.api.nvim_create_augroup('CmpSourceCargo', { clear = true }),
        pattern = 'Cargo.toml',
        callback = function()
          cmp.setup.buffer { sources = { { name = 'crates', priority = 700 } } }
        end,
      })
      -- local opts = { silent = true }
      -- opts.silent = true
      opts.smart_insert = true
      opts.popup = {
        autofocus = true,
        show_version_date = true,
        border = 'rounded',
        show_dependency_version = true,
        padding = 1,
      }
      opts.null_ls = {
        enabled = true,
        name = 'Crates',
      }
      opts.src = {
        insert_closing_quote = true,
        text = {
          prerelease = '  pre-release ',
          yanked = '  yanked ',
        },
        cmp = {
          enabled = true,
          name = 'crates.nvim',
          use_custom_kind = true,
          kind_text = {
            version = 'Version',
            feature = 'Feature',
          },
          kind_highlight = {
            version = 'CmpItemKindVersion',
            feature = 'CmpItemKindFeature',
          },
        },
      }

      local function show_documentation()
        local filetype = vim.bo.filetype
        if vim.tbl_contains({ 'vim', 'help' }, filetype) then
          vim.cmd('h ' .. vim.fn.expand '<cword>')
        elseif vim.tbl_contains({ 'man' }, filetype) then
          vim.cmd('Man ' .. vim.fn.expand '<cword>')
        elseif vim.fn.expand '%:t' == 'Cargo.toml' and crates.popup_available() then
          crates.show_popup()
        else
          vim.lsp.buf.hover()
        end
      end
      -- vim.keymap.set("n", "K", show_documentation, { silent = true })

      crates.setup(opts)
      wk.register {
        ['<leader>a'] = {
          name = '󱧕 Crates',
          t = { crates.toggle, 'Toggle Crate' },
          r = { crates.reload, 'Reload Crate' },

          v = { crates.show_versions_popup, 'Show Versions' },
          f = { crates.show_features_popup, 'Show Features' },
          d = { crates.show_dependencies_popup, 'Show Dependencies' },
          s = { crates.show_popup, 'Show Crate' },

          u = { crates.update_crate, 'Update Crate' },
          a = { crates.update_all_crates, 'Update All Crates' },
          U = { crates.upgrade_crate, 'Upgrade Crate' },
          A = { crates.upgrade_all_crates, 'Upgrade All Crates' },

          x = { crates.expand_plain_crate_to_inline_table, 'Expand Crate' },
          X = { crates.extract_crate_into_table, 'Extract Crate' },

          H = { crates.open_homepage, 'Open Homepage' },
          R = { crates.open_repository, 'Open Repository' },
          D = { crates.open_documentation, 'Open Documentation' },
          C = { crates.open_crates_io, 'Open Crates.io' },
          K = { show_documentation, 'Show Documentation' },
        },
      }
      wk.register({
        ['<leader>a'] = {
          name = '󱧕 Crates',
          v = { crates.update_crates, 'Update Crates' },
          V = { crates.upgrade_crates, 'Upgrade Crates' },
        },
      }, { mode = 'v' })
    end,
  },
  {
    'vxpm/ferris.nvim',
    lazy = true,
    event = 'BufRead *.rs',
    opts = function(_, opts)
      local wk = require 'which-key'

      wk.register {
        ['<leader>'] = {
          r = {
            name = ' Rust',
            l = { require 'ferris.methods.view_memory_layout', 'Rust memory layouts' }, -- f = { "<cmd>Telescope find_files<cr>", "Find File" },
            e = { require 'ferris.methods.expand_macro', 'Expand Macro' },
            j = { require 'ferris.methods.join_lines', 'Join Lines' },
            h = { require 'ferris.methods.view_hir', 'View HIR' },
            m = { require 'ferris.methods.view_mir', 'View MIR' },
            t = { require 'ferris.methods.view_item_tree', 'View Item Tree' },
            s = { require 'ferris.methods.view_syntax_tree', 'View Syntax Tree' },
            o = { require 'ferris.methods.open_cargo_toml', 'Open Cargo.toml' },
            p = { require 'ferris.methods.open_parent_module', 'Open Parents Module' },
            d = { require 'ferris.methods.open_documentation', 'Open Documentation' },
            w = { require 'ferris.methods.reload_workspace', 'Reload Workspace' },
            r = { require 'ferris.methods.rebuild_macros', 'Rebuild Macros' },
          },
        },
      }
    end,
    -- your options here
  },
  {
    'nvim-neotest/neotest',
    optional = true,
    opts = function(_, opts)
      if not opts.adapters then
        opts.adapters = {}
      end
      local rustaceanvim_avail, rustaceanvim = pcall(require, 'rustaceanvim.neotest')
      if rustaceanvim_avail then
        table.insert(opts.adapters, rustaceanvim)
      end
    end,
  },
}
