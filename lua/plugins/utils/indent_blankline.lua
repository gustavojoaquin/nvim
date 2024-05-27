return {
  'lukas-reineke/indent-blankline.nvim',
  lazy = true,
  event = 'BufRead',
  main = 'ibl',

  opts = function(_, opts)
    opts.indent = { char = "▏" }
    opts.scope = { show_start = false, show_end = false }
    opts.exclude = {
      buftypes = {
        "nofile",
        "prompt",
        "quickfix",
        "terminal",
      },
      filetypes = {
        "aerial",
        "alpha",
        "dashboard",
        "help",
        "lazy",
        "mason",
        "neo-tree",
        "NvimTree",
        "neogitstatus",
        "notify",
        "startify",
        "toggleterm",
        "Trouble",
      },
    }
  end,
}
