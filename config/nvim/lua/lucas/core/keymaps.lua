vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", {desc = "Clear search highlights" })
keymap.set("n", "<leader>so", "<cmd>%so<cr>", { desc = "Leader [S]hout [O]ut" })

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "[S]plit [V]ertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "[S]plit [H]orizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make [S]plits [E]qual Sizes" })
keymap.set("n", "<leader>sx", "<cmd>close<cr>", { desc = "[S]plit [X]close" })

keymap.set("n", "<leader>to", "<cmd>tabnew<cr>", { desc = "[T]ab [O]pen" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "[T]ab [X]close" })
keymap.set("n", "<leader>tp", "<cmd>tabp<cr>", { desc = "[T]ab [P]revious" })
keymap.set("n", "<leader>tn", "<cmd>tabn<cr>", { desc = "[T]ab [N]ext" })
