return {
  'nvim-tree/nvim-tree.lua',
  lazy = false,
  denpendencies = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
  version = 'nightly', -- optional, updated every week. (see issue #1193)
  config = function()
    local status, nt = pcall(require, "nvim-tree")
    if not status then
      return
    end

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- change color for arrows in tree to light blue
    vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

    nt.setup({
      view = {
        mappings = {
          list = {
            { key = "u", action = "dir_up" },
            { key = "v", action = "vsplit" },
          },
        },
      },
      -- change folder arrow icons
      renderer = {
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = true,
          },
        },
      },
    })
  end
}
