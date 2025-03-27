-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hererocks

-- JQ for formatting json
vim.api.nvim_set_keymap(
  "n",
  "<leader>jj",
  ":%!jq .<CR>",
  { noremap = true, silent = true, desc = "JQ Json quick format" }
)
