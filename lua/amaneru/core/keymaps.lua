vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<Esc>")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<cr>") -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<cr>") -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<cr>") -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<cr>") --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<cr>") --  go to previous tab

-- clear search highlights
keymap.set("n", "<leader>nh", "<cmd>nohl<cr>")

-- nvim-tree
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>") -- toggle file explorer
keymap.set("n", "<leader>cb", "<cmd>NvimTreeFindFile<cr>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set('n', '<leader>fb', '<cmd>lua require("telescope").extensions.file_browser.file_browser({path="%:p:h", cwd=telescope_buffer_dir(), respect_git_ignore=false})<CR>')
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>lds", "<cmd>Telescope lsp_document_symbols<cr>") -- list all functions/structs/classes/modules in the current buffer

-- telescope git commands
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- troubles
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })

-- vim-maximizer
keymap.set("n", "<leader>sm", "<cmd>MaximizerToggle<cr>") -- toggle split window maximization

-- restart lsp server
keymap.set("n", "<leader>rs", "<cmd>LspRestart<cr>")

-- unbind the fucking man
keymap.set("", "<S-k>", "<Nop>")
