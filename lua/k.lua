local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- QOL binds
map("n", "<C-c>", "m`ggVGy``", { desc = "Copy file" })
map({ "n", "v" }, ";", ":", { desc = "Enter command mode" })
map("n", "<Esc>", "<cmd>nohlsearch<cr>", opts)

-- Gotos
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { noremap = true, silent = true, desc = "Go to declaration" })
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>",  { noremap = true, silent = true, desc = "Go to definition" })

-- Unbind navigation nuisances
map({ "i", "n", "v" }, "<s-down>", "<down>", opts)
map({ "i", "n", "v" }, "<s-up>",   "<up>",   opts)

-- Better shifting
map("v", ">", ">gv", opts)
map("v", "<", "<gv", opts)

-- Move lines
map("v", "<A-Down>", ":m '>+1<cr>gv=gv", { noremap = true, silent = true, desc = "Move selected lines down" })
map("v", "<A-Up>",   ":m '<-2<cr>gv=gv", { noremap = true, silent = true, desc = "Move selected lines up" })
map("n", "<A-Down>", ":m .+1<cr>==",     { noremap = true, silent = true, desc = "Move line down" })
map("n", "<A-Up>",   ":m .-2<cr>==",     { noremap = true, silent = true, desc = "Move line up" })

-- Splits
map("n", "<C-a>|", ":vsplit<cr>", opts)
map("n", "<C-a>-", ":split<cr>",  opts)

-- Buffers
map("n", "<s-tab>", ":bp<cr>", opts)
map("n", "<tab>",   ":bn<cr>", opts)

-- Terms
map("t", "<Esc>", "<C-\\><C-n><C-w>h",  { noremap = true, silent = true, desc = "Exit term mode" })
map("n", "<leader>tn", ":term<cr>i",    { noremap = true, silent = true, desc = "Create a new term" })

-- Move to window using <ctrl> arrow keys
map("n", "<C-a><Right>", "<C-w>l", { desc = "Go to Right Window", remap = true })
map("n", "<C-a><Left>",  "<C-w>h", { desc = "Go to Left Window",  remap = true })
map("n", "<C-a><Down>",  "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-a><Up>",    "<C-w>k", { desc = "Go to Upper Window", remap = true })

-- Resize window using <ctrl-shift> arrow keys
map("n", "<C-S-Right>",  ":vertical resize +2<cr>", { desc = "Increase Window Width"  })
map("n", "<C-S-Left>", ":vertical resize -2<cr>",   { desc = "Decrease Window Width"  })
map("n", "<C-S-Down>",  ":resize -2<cr>",           { desc = "Decrease Window Height" })
map("n", "<C-S-Up>",    ":resize +2<cr>",           { desc = "Increase Window Height" })

-- "Lazy shift finger" command abbreviations
-- https://superuser.com/questions/1060424/how-can-i-permanently-map-the-vim-command-w-to-w
vim.cmd([[
    cabbrev W w
    cabbrev Q q
    cabbrev X x
    cabbrev WQ wq
    cabbrev Wq wq
    cabbrev WQA wqa
    cabbrev WQa wqa
    cabbrev Wqa wqa
    cabbrev Qa qa
]])

-- Telescope mappings
local ts = require("telescope.builtin")
map("n", "<leader>ff", ts.find_files,                 { desc = "Find files"    })
map("n", "<leader>fg", ts.live_grep,                  { desc = "Find grep"     })
map("n", "<leader>fb", ts.buffers,                    { desc = "Find buffers"  })
map("n", "<leader>fp", "<cmd>Telescope projects<cr>", { desc = "Find projects" })
