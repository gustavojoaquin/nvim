return {
  {
    'p00f/clangd_extensions.nvim',
    ft = { 'c', 'cpp' },
    lazy = true,
    event = 'BufRead *.cpp *.c',
    opts = {
      inlay_hints = {
        inline = true,
      },
    },
  },
  {
    'Civitasv/cmake-tools.nvim',
    lazy = true,
    ft = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
    dependencies = {
      'jay-babu/mason-nvim-dap.nvim',
    },
    opts = {},
  },
}
