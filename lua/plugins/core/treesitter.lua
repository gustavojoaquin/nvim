-- if true then return {} end
return {
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    event = 'VeryLazy',
    lazy = true,
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = true,
    -- event = 'VeryLazy',
    build = ':TSUpdate',
    config = function()
      local opts = {}
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
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
}
