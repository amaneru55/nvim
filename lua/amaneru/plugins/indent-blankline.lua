return {
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    local status, ib = pcall(require, "indent_blankline")
    if not status then
      return
    end
    
    ib.setup({
      char = "┆",
      show_end_of_line = true,
    })
  end
}
