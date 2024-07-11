require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<F5>", ":!g++ -DLOCAL -I/home/shahanwaz/Code/cp/includes % -o %< && ./%< && rm %<<CR>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
