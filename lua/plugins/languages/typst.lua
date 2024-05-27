return {
  { 'kaarmu/typst.vim', lazy = true, ft = { 'typst' } },
  {
    'chomosuke/typst-preview.nvim',
    cmd = { 'TypstPreview', 'TypstPreviewToggle', 'TypstPreviewUpdate' },
    build = function()
      require('typst-preview').update()
    end,
    opts = {},
  },
}
