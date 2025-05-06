-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  {
    'patrickpichler/hovercraft.nvim',
    lazy = true,
    event = 'VeryLazy',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
    },
    keys = {},
    opts = function()
      local hovercraft = require 'hovercraft'

      local opts = {}
      -- local hc = require "hovercraft"
      local wk = require 'which-key'
      opts.providers = {
        providers = {
          {
            'LSP',
            require('hovercraft.provider.lsp.hover').new(),
          },
          {
            'Man',
            require('hovercraft.provider.man').new(),
          },
          {
            'Dictionary',
            require('hovercraft.provider.dictionary').new(),
          },
          { 'Git Issue',   require('hovercraft.provider.github.issue').new() },
          { 'Git Repo',    require('hovercraft.provider.github.repo').new() },
          { 'Git User',    require('hovercraft.provider.github.user').new() },
          { 'Git Blame',   require('hovercraft.provider.git.blame').new() },
          -- { "Git", require("hovercraft.provider.git").new() },
          -- { "Github", require("hovercraft.provider.github").new() },
          { 'Diagnostics', require('hovercraft.provider.diagnostics').new() },
        },
      }
      opts.window = {
        border = 'single',
      }
      opts.keys = {}

      wk.add {
        {
          '<C-p>',
          function()
            hovercraft.scroll { delta = -4 }
          end,
          desc = 'Scroll up',
        },
        {
          '<C-i>',
          function()
            hovercraft.scroll { delta = 4 }
          end,
          desc = 'Scroll down',
        },
        {
          'K',
          function()
            hovercraft.hover_next()
          end,
          desc = 'Next hover',
        },
        {
          'J',
          function()
            hovercraft.hover_next { step = -1 }
          end,
          desc = 'Previous hover',
        },
        {
          '<S-TAB>',
          function()
            if hovercraft.is_visible() then
              hovercraft.enter_popup()
            else
              hovercraft.hover()
            end
          end,
          desc = 'Show hover or hide',
        },
      }

      return opts
    end,
  },
}
