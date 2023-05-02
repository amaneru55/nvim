return {
  "github/copilot.vim",
  lazy = false,
  config = function()
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_assume_mapped = true
    vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    vim.g.copilot_filetypes = {
      ["*"] = false,
      ["javascript"] = true,
      ["typescript"] = true,
      ["typescriptreact"] = true,
      ["javascriptreact"] = true,
      ["lua"] = true,
      ["markdown"] = true,
      ["rust"] = true,
      ["c"] = true,
      ["c#"] = true,
      ["c++"] = true,
      ["go"] = true,
      ["python"] = true,
    }
  end,
}
