local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- NvimTree --
keymap("n", "<leader>nt", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>nf", ":NvimTreeFindFile<cr>", opts)

-- Intellisense --
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
keymap("n", "K",  "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
keymap("n", "<C-n>", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", opts)
keymap("n", "<C-p>", "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", opts)

-- Undotree --
keymap("n", "<leader>u", ":UndotreeToggle<cr>", opts)

-- Fugitive --
keymap("n", "<leader>gs", ":G<cr>", opts)
keymap("n", "<leader>gd", ":Gvdiff<cr>", opts)
keymap("n", "<leader>gh", ":diffget //2<cr>", opts)
keymap("n", "<leader>gl", ":diffget //3<cr>", opts)

-- Harpoon --
keymap("n", "<leader>ha", ":lua require('harpoon.mark').add_file()<cr>", opts)
keymap("n", "<leader>hc", ":lua require('harpoon.mark').clear_all()<cr>", opts)
keymap("n", "<leader>ht", ":lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
keymap("n", "<leader>a", ":lua require('harpoon.ui').nav_file(1)<cr>", opts)
keymap("n", "<leader>s", ":lua require('harpoon.ui').nav_file(2)<cr>", opts)
keymap("n", "<leader>d", ":lua require('harpoon.ui').nav_file(3)<cr>", opts)
keymap("n", "<leader>f", ":lua require('harpoon.ui').nav_file(4)<cr>", opts)

-- Telescope --
keymap("n", "<leader>fi", ":lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>fo", ":lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<leader>fs", ":lua require('telescope.builtin').grep_string()<cr>", opts)
keymap("n", "<leader>hh", ":lua require('telescope.builtin').commands()<cr>", opts)
keymap("n", "<leader>vh", ":lua require('telescope.builtin').help_tags()<cr>", opts)
keymap("n", "<leader>vb", ":lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>gb", ":lua require('telescope.builtin').git_branches()<cr>", opts)
keymap("n", "<leader>gc", ":lua require('telescope.builtin').git_commits()<cr>", opts)
keymap("n", "<leader>gt", ":lua require('telescope.builtin').git_stash()<cr>", opts)

-- Toggleterm --
keymap("n", "<leader>t", ":ToggleTerm<cr>", opts)

-- Misc --

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Y acts like other capitals
keymap("n", "Y", "y$", opts)

-- Keep cursor centered
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ'z", opts)

-- Undo break points
keymap("i", ",", ",<c-g>u", opts)
keymap("i", ".", ".<c-g>u", opts)
keymap("i", "!", "!<c-g>u", opts)
keymap("i", "?", "?<c-g>u", opts)

-- Jumplist mutations
keymap("n", "<expr>j", "(v:count > 5 ? \"m\'\" . v:count : \"\") . \'j\'", opts)
keymap("n", "<expr>k", "(v:count > 5 ? \"m\'\" . v:count : \"\") . \'k\'", opts)

-- Moving text around
keymap("v", "J", ":m '>+1<cr>gv=gv", opts)
keymap("v", "K", ":m '<-2<cr>gv=gv", opts)
keymap("v", "p", '"_dP', opts)
--inoremap <C-j> <esc>:m .+1<cr>==
--inoremap <C-k> <esc>:m .-2<cr>==
--nnoremap <leader>j :m .+1<cr>==
--nnoremap <leader>k :m .-2<cr>==
