return {
  {
    'willothy/wezterm.nvim',
    lazy = true,
    config = true,
  },
  {
    '3rd/image.nvim',
    lazy = true,
    opts = {
      backend = 'kitty', -- whatever backend you would like to use

      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { 'markdown', 'vimwiki' }, -- markdown extensions (ie. quarto) can go here
        },
        neorg = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { 'norg' },
        },
        html = {
          enabled = false,
        },
        css = {
          enabled = false,
        },
      },
      max_width = 100,
      max_height = 12,
      max_height_window_percentage = math.huge,
      max_width_window_percentage = 100,
      window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
      tmux_show_only_in_active_window = true,
      window_overlap_clear_ft_ignore = { 'cmp_menu', 'cmp_docs', '' },
    },
  },
}
