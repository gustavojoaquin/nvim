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
      opts.completion = {
        insert_closing_quote = true,
        text = {
          prerelease = '   pre-release ',
          yanked = '   yanked ',
        },
        cmp = {
          enabled = true,
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

      wk.add({
        { "<leader>c", group = '󱧕 Crates' },
        { "<leader>ct", crates.toggle, desc = 'Toggle Crate' },
        { "<leader>cr", crates.reload, desc = 'Reload Crate' },

        { "<leader>cv", crates.show_versions_popup, desc = 'Show Versions' },
        { "<leader>cf", crates.show_features_popup, desc = 'Show Features' },
        { "<leader>cd", crates.show_dependencies_popup, desc = 'Show Dependencies' },
        { "<leader>cs", crates.show_popup, desc = 'Show Crate' },

        { "<leader>cu", crates.update_crate, desc = 'Update Crate' },
        { "<leader>ca", crates.update_all_crates, desc = 'Update All Crates' },
        { "<leader>cU", crates.upgrade_crate, desc = 'Upgrade Crate' },
        { "<leader>cA", crates.upgrade_all_crates, desc = 'Upgrade All Crates' },

        { "<leader>cx", crates.expand_plain_crate_to_inline_table, desc = 'Expand Crate' },
        { "<leader>cX", crates.extract_crate_into_table, desc = 'Extract Crate' },

        { "<leader>cH", crates.open_homepage, desc = 'Open Homepage' },
        { "<leader>cR", crates.open_repository, desc = 'Open Repository' },
        { "<leader>cD", crates.open_documentation, desc = 'Open Documentation' },
        { "<leader>cC", crates.open_crates_io, desc = 'Open Crates.io' },
        { "<leader>cK", show_documentation, desc = 'Show Documentation' },
      })

      wk.add({
        mode = { "v" },
        { "<leader>a", group = '󱧕 Crates' },
        { "<leader>av", crates.update_crates, desc = "Update Crates" },
        { "<leader>aV", crates.upgrade_crates, desc = "Upgraderade Crates" },
      })
    end,
  },
  {
    'vxpm/ferris.nvim',
    lazy = true,
    event = 'BufRead *.rs',
    opts = function(_, opts)
      local wk = require 'which-key'

      wk.add({
        { "<leader>r", group = " Rust" },
        { "<leader>rl", require 'ferris.methods.view_memory_layout', desc = 'Rust memory layouts' },
        { "<leader>re", require 'ferris.methods.expand_macro', desc = 'Expand Macro' },
        { "<leader>rj", require 'ferris.methods.join_lines', desc = 'Join Lines' },
        { "<leader>rh", require 'ferris.methods.view_hir', desc = 'View HIR' },
        { "<leader>rm", require 'ferris.methods.view_mir', desc = 'View MIR' },
        { "<leader>rt", require 'ferris.methods.view_item_tree', desc = 'View Item Tree' },
        { "<leader>rs", require 'ferris.methods.view_syntax_tree', desc = 'View Syntax Tree' },
        { "<leader>ro", require 'ferris.methods.open_cargo_toml', desc = 'Open Cargo.toml' },
        { "<leader>rp", require 'ferris.methods.open_parent_module', desc = 'Open Parents Module' },
        { "<leader>rd", require 'ferris.methods.open_documentation', desc = 'Open Documentation' },
        { "<leader>rw", require 'ferris.methods.reload_workspace', desc = 'Reload Workspace' },
        { "<leader>rr", require 'ferris.methods.rebuild_macros', desc = 'Rebuild Macros' },
      })
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
