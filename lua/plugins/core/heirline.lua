-- if true then
--   return {}
-- end
return {
  {
    'rebelot/heirline.nvim',
    dependencies = { 'Zeioth/heirline-components.nvim' },
    lazy = true,
    event = 'VeryLazy',
    config = function(_, opts)
      local heirline = require 'heirline'
      local heirline_components = require 'heirline-components.all'
      opts.statuscolumn = {
        init = function(self)
          self.bufnr = vim.api.nvim_get_current_buf()
        end,
        heirline_components.component.foldcolumn(),
        heirline_components.component.numbercolumn(),
        heirline_components.component.signcolumn(),
      }
      opts.statusline = { -- UI statusbar
        hl = { fg = 'fg', bg = 'bg' },
        heirline_components.component.mode(),
        heirline_components.component.git_branch(),
        heirline_components.component.file_info(),
        heirline_components.component.git_diff(),
        heirline_components.component.diagnostics(),
        heirline_components.component.fill(),
        heirline_components.component.cmd_info(),
        heirline_components.component.fill(),
        heirline_components.component.lsp(),
        heirline_components.component.compiler_state(),
        heirline_components.component.virtual_env(),
        heirline_components.component.nav(),
        heirline_components.component.mode { surround = { separator = 'right' } },
      }

      -- Setup
      heirline_components.init.subscribe_to_events()
      heirline.load_colors(heirline_components.hl.get_colors())
      heirline.setup(opts)
    end,
  },
}
