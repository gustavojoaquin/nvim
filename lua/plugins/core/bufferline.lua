if true then
  return {}
end
return {
  {
    'akinsho/bufferline.nvim',
    lazy = true,
    event = 'BufRead',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = function(_, opts) end,
  },
}
