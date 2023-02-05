return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup {
      options = {
        -- ... your lualine config
        theme = 'tokyonight'
        -- ... your lualine config
      }
    }
  end
}
