-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

keymap.set("i", "jk", "<Esc>")

-- Neo Tree
keymap.set("n", "<leader>cb", "<cmd>Neotree reveal<cr>")

keymap.set("", "<s-k>", "<Nop>")

keymap.set("n", "<leader>sx", require("telescope.builtin").resume, { noremap = true, silent = true, desc = "Resume" })
