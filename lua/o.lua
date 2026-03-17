local o = vim.opt
local ol = vim.opt_local

-- Colors
-- vim.api.nvim_create_autocmd("VimEnter", {
--     pattern = "*",
--     callback = function()
--         vim.cmd("highlight StatusLine   guibg=NONE")
--         vim.cmd("highlight StatusLineNC guibg=NONE")
--     end,
-- })

vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NonText", { bg = "NONE", fg = "#333339" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE", fg = "#333339" }) -- line numbers
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })

-- Line numbers
o.number = true
o.relativenumber = false
o.fillchars:append({ eob = "." })

-- Misc
o.mouse = "a"
o.clipboard = "unnamedplus"
o.termguicolors = true
o.cmdheight = 0
o.statusline = "%= %l,%c %m"

-- Tabs
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.smartindent = true

-- Invisibles
o.list = true
o.listchars = {
    tab = "> ",
    trail = "-",
}

-- View
o.textwidth = 80
o.scrolloff = 2

-- History
o.undolevels = 5000
o.history = 500
o.undofile = true
o.undodir = vim.fn.expand("~/.local/cache/nvim/undo")

-- Autocommand for Typst
vim.api.nvim_create_autocmd("FileType", {
    pattern = "typst",
    callback = function()
        ol.expandtab = true
        ol.shiftwidth = 4
        ol.tabstop = 4
        ol.smartindent = true
    end,
})

vim.filetype.add({
    extension = {
        xml = "xml",
        xsl = "xsl",
    }
})

-- Autocommand for XML/XSL
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "xml", "xsl" },
    callback = function()
        ol.expandtab = true
        ol.shiftwidth = 2
        ol.tabstop = 2
        ol.smartindent = false
    end,
})

-- Default borders
vim.o.winborder = "double"
