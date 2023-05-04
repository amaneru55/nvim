return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    {
      "s1n7ax/nvim-window-picker",
      config = function()
        require("window-picker").setup({
          autoselectg_one = true,
          include_current = false,
          filter_rules = {
            bo = {
              filetype = { "neo-tree", "neo-tree-popup", "notify" },
              buftype = { "terminal", "quickfix" },
            },
          },
          other_win_hl_color = "#e35e4f",
        })
      end,
    },
  },
  config = function()
    require("neo-tree").setup({
      pupup_border_style = "rounded",
      default_component_configs = {},
      window = {
        mappings = {
          ["o"] = "open_with_window_picker",
          ["v"] = "open_vsplit",
          ["s"] = "open_split",
        },
      },
    })
  end,
}
