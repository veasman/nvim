local o = vim.o

o.guicursor = ""
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true
o.number = true
o.relativenumber = true
o.wrap = false
o.hlsearch = false
o.swapfile = false
o.undodir = os.getenv("HOME")..'/.local/share/nvim/undodir'
o.undofile = true
o.scrolloff = 8
o.completeopt = "menuone,noinsert,noselect"
o.signcolumn = "yes"
o.termguicolors = true
o.secure = true
--o.cmdheight = 2
o.updatetime = 50
o.shortmess = "c"
o.colorcolumn = "80"

--vim.api.nvim_command[[highlight Normal guibg=none]]
vim.g.nvcode_termcolors = 256

vim.cmd [[colorscheme onedark]]
