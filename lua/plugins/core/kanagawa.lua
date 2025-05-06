if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    opts = function(_, opts)
      opts.overrides = function(colors)
        local theme = colors.theme
        return {
          TelescopeTitle = { fg = theme.ui.special, bold = true },
          TelescopePromptNormal = { bg = theme.ui.bg_p1 },
          TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
          TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
          TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
          TelescopePreviewNormal = { bg = theme.ui.bg_dim },
          TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

          TelescopePromptPrefix = { fg = '#e56a73', bg = theme.ui.bg_p1 },
          TelescopePromptTitle = { fg = theme.ui.bg_p1, bg = '#e56a73' },
          TelescopePreviewTitle = { fg = '#000000', bg = '#40a02b' },
          TelescopeResultsTitle = { fg = '#000000', bg = '#fe640b' },
        }
      end
    end,
  },
}
