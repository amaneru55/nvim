return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
    {
      'nvim-telescope/telescope-file-browser.nvim',
    }
  },
  config = function()
    local status, telescope = pcall(require, 'telescope')
    function telescope_buffer_dir()
      return vim.fn.expand('%:p:h')
    end
    -- local actions_status, actions = pcall(require, 'telescope.actions')


    local fb_actions = telescope.extensions.file_browser.actions

    if not status then
      return
    end

    telescope.setup({
      extension = {
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        },
        file_browser = {
          theme = 'dropdown',
          hijack_netrw = true,
          mappings={
            ['i']={
              ['<C-w>'] = function() vim.cmd('normal vbd') end,

            },
            ['n']={
              ['h']=fb_actions.goto_parent_dir,
              ['/']=function()
                vim.cmd('startinsert')
              end
            }
          }
        },
      }
    })
    telescope.load_extension('fzf')
    telescope.load_extension('file_browser')
  end
}
