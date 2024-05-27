return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = true,
    event = 'BufRead',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      lazy = true,
    },
    build = ':TSUpdate',
    opts = function(_, opts)
      opts.ensure_installed = {
        'lua',
        'vim',
        'vimdoc',
        'query',
        'elixir',
        'heex',
        'javascript',
        'html',
        'rust',
        'python',
        'svelte',
        'cpp',
        'bash',
        'markdown',
        'markdown_inline',
        'regex',
        'cpp',
        'c',
        'objc',
        'cuda',
        'proto',
        'go',
        'gomod',
        'gosum',
        'gowork',
        'java',
        'html',
        'python',
        'toml',
        'json',
        'jsonc',
        'yaml',
        'typescript',
        'tsx',
      }
      opts.sync_install = true
      opts.highlight = { enable = true }
      opts.indent = { enable = true }
    end,
  },
}
