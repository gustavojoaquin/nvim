if true then return {} end
return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = function(_, opts)
      opts.style = 'night'
      opts.on_highlights = function(hl, c)
        local prompt = '#2d3149'
        hl.TelescopeNormal = {
          bg = c.bg_dark,
          fg = c.fg_dark,
        }
        hl.TelescopeBorder = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopePromptNormal = {
          bg = prompt,
        }
        hl.TelescopePromptBorder = {
          bg = prompt,
          fg = prompt,
        }
        hl.TelescopePromptTitle = {
          bg = prompt,
          fg = prompt,
        }
        hl.TelescopePreviewTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopeResultsTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        -- h1.TelescopePromptPrefix = { fg = '#e56a73', bg = theme.ui.bg_p1 }
        -- h1.TelescopePromptTitle = { fg = theme.ui.bg_p1, bg = '#e56a73' }
        -- h1.TelescopePreviewTitle = { fg = '#000000', bg = '#40a02b' }
        -- h1.TelescopeResultsTitle = { fg = '#000000', bg = '#fe640b' }
      end
    end,
  },
}
