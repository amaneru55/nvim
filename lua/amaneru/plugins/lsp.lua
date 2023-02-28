return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        'williamboman/mason.nvim',
        config = function()
          local status, mason = pcall(require, "mason")
          if not status then
            return
          end

          mason.setup({
            ui = {
              icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
              }
            }
          })
        end
      },
      {
        'williamboman/mason-lspconfig.nvim',
        config = function()
          local status, mason_lspconfig = pcall(require, "mason-lspconfig")
          if not status then
            return
          end

          mason_lspconfig.setup({
            ensure_installed = {
              "lua_ls",
              "rust_analyzer",
              "clangd",
              "cssls",
              "html",
              "dockerls",
              "gopls",
              "jsonls",
              "tsserver",
              "marksman",
              "sqlls",
              "taplo",
              "tailwindcss",
              "emmet_ls",
            }
          })
        end
      },
      {
        "simrat39/rust-tools.nvim"
      }, -- rust server
      {
        "jose-elias-alvarez/typescript.nvim"
      },
      {
         "glepnir/lspsaga.nvim",
          event = "BufRead",
          config = function()
            require("lspsaga").setup({
              finder = {
                --percentage
                max_height = 0.5,
                force_max_height = false,
                -- keys = {
                --   jump_to = 'p',
                --   edit = { 'o', '<CR>' },
                --   vsplit = 's',
                --   split = 'i',
                --   tabe = 't',
                --   tabnew = 'r',
                --   quit = { 'q', '<ESC>' },
                --   close_in_preview = '<ESC>'
                -- },
              },
          })
          end,
          dependencies = {
            {"nvim-tree/nvim-web-devicons"}
          }
      },
      {
        "hrsh7th/cmp-nvim-lsp",
      }
    },
    config = function()
      local status, lspconfig = pcall(require, "lspconfig")
      if not status then
        return
      end

      local cmp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      if not cmp_status then
        return
      end

       -- import typescript plugin safely
      local typescript_setup, typescript = pcall(require, "typescript")
      if not typescript_setup then
        return
      end

      -- import rust-tools plugin safely
      local rust_setup, rt = pcall(require, "rust-tools")
      if not rust_setup then
        return
      end

      local on_attach = function(client, bufnr)
        local keymap = vim.keymap
        -- keybind options
        local opts = { noremap = true, silent = true, buffer = bufnr }

        -- set keybinds
        keymap.set("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
        keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
        keymap.set("n", "gD", "<cmd>Lspsaga goto_definition<CR>")
        keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
        keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
        keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
        keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
        keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
        keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
        keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
        keymap.set("n", "<leader>k", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
        keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side
        keymap.set("n", "<leader>tt", "<cmd>Lspsaga term_toggle<CR>", opts) -- see outline on right hand side

        -- typescript specific keymaps (e.g. rename file and update imports)
        if client.name == "tsserver" then
          keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
          keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
          keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
        end
      end

      local capabilities = cmp_nvim_lsp.default_capabilities()

      local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -- configure typescript server with plugin
      typescript.setup({
        server = {
          capabilities = capabilities,
          on_attach = on_attach,
        },
      })

      -- configure rust server with plugin
      rt.setup({
        server = {
          capabilities = capabilities,
          on_attach = on_attach,
        },
      })

      -- configure cpp clangd
      lspconfig["clangd"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure css server
      lspconfig["cssls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure html server
      lspconfig["html"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig["cssls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig["lua_ls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure emmet language server
      lspconfig["emmet_ls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
      })

      -- configure pyright server
      lspconfig["pyright"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          pyright = {
            autoImportCompletion = true,
            python = {
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
      })

    end
  },
}
