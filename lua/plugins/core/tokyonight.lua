-- if true then return {} end
return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = function(_, opts)
      opts.style = 'night'
      opts.on_highlights = function(hl, c)
        local prompt = "#2d3149"
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
          bg = '#e56a73',
          fg = prompt,
        }
        hl.TelescopePreviewTitle = {
          bg = '#40a02b',
          fg = c.bg_dark,
        }
        hl.TelescopeResultsTitle = {
          bg = '#fe640b',
          fg = c.bg_dark,
        }
        hl.TelescopePromptPrefix = { fg = "#e56a73", bg = prompt }
      end
    end,
  },
}
