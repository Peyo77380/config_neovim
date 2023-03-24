local opts = { 
	noremap = true,
	silent = true
}

local term_opts = {
	silent = true
}

local keymap = vim.api.nvim_set_keymap


--Modifie le leader key sur espace
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NORMAL MODE 
-- Changer la fenetre selectionnee
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- redimensionner les fenetres avec les fleches

keymap("n", "<leader>h", ":resize -2<cr>", opts)
keymap("n", "<leader>j", ":vertical resize -2<cr>", opts)
keymap("n", "<leader>k", ":vertical resize +2<cr>", opts)
keymap("n", "<leader>l", ":resize +2<cr>", opts)

-- changer de buffer
keymap("n", "<S-k>", ":bnext<cr>", opts)
keymap("n", "<S-j>", ":bprevious<cr>", opts)

-- Affiche l'explorateur de fichier
keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- VISUAL MODE
-- Indentation sans perdre la selection
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Bouge le texte en haut d'une ligne
keymap("v", "<A-j>", ":m '>+1<cr>==gv", opts)
keymap("v", "<A-k>", ":m '<-2<cr>==gv", opts)
keymap("v", "p", '"_dP', opts)

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
