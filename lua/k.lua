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

-- Buffers
map("n", "<s-tab>", ":bp<cr>", opts)
map("n", "<tab>",   ":bn<cr>", opts)

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
map("n", "<leader>ff", ts.find_files,                 { desc = "Find files"         })
map("n", "<leader>fg", ts.live_grep,                  { desc = "Find grep"          })
map("n", "<leader>fb", ts.buffers,                    { desc = "Find buffers"       })
map("n", "<leader>fd", ts.diagnostics,                { desc = "Find diagnostics"   })
map("n", "<leader>fs", ts.lsp_document_symbols,       { desc = "Find symbols"       })
map("n", "<leader>fp", "<cmd>Telescope projects<cr>", { desc = "Find projects"      })

local gitsigns = require("gitsigns")
map("n", "<leader>hs", gitsigns.stage_hunk,                 { desc = "Stage hunk"         })
map("n", "<leader>hr", gitsigns.reset_hunk,                 { desc = "Reset hunk"         })

map("v", "<leader>hs", function()
    gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Stage hunk" })

map("v", "<leader>hr", function()
    gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Reset hunk" })

map("n", "<leader>hS", gitsigns.stage_buffer,         { desc = "Stage buffer"       })
map("n", "<leader>hR", gitsigns.reset_buffer,         { desc = "Reset buffer"       })
map("n", "<leader>hp", gitsigns.preview_hunk,         { desc = "Preview hunk"       })
map("n", "<leader>hi", gitsigns.preview_hunk_inline,  { desc = "Preview hunk inline" })

map("n", "<leader>hb", function()
    gitsigns.blame_line({ full = true })
end, { desc = "Blame line" })

map("n", "<leader>hd", gitsigns.diffthis,             { desc = "Diff this"          })

map("n", "<leader>hD", function()
    gitsigns.diffthis("~")
end, { desc = "Diff since ~" })

map("n", "<leader>hq", gitsigns.setqflist)

map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
map("n", "<leader>tw", gitsigns.toggle_word_diff)

map("n", "]h", function()
    gitsigns.nav_hunk("next")
end)

map("n", "[h", function()
    gitsigns.nav_hunk("prev")
end)
