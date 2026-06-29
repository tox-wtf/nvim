return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
        require("tiny-inline-diagnostic").setup({
            preset = "minimal",
            transparent_bg = false,
            transparent_cursorline = false,

            -- Customize highlight groups for colors
            -- Use Neovim highlight group names or hex colors like "#RRGGBB"
            hi = {
                error = "DiagnosticError",     -- Highlight for error diagnostics
                warn = "DiagnosticWarn",       -- Highlight for warning diagnostics
                info = "DiagnosticInfo",       -- Highlight for info diagnostics
                hint = "DiagnosticHint",       -- Highlight for hint diagnostics
                arrow = "NonText",             -- Highlight for the arrow pointing to diagnostic
                background = "CursorLine",     -- Background highlight for diagnostics
                mixing_color = "Normal",       -- Color to blend background with (or "None")
            },

            options = {
                multilines = {
                    enabled = true,
                    always_show = false,
                },

                show_source = {
                    enabled = false,
                    if_many = true,
                },

                show_related = {
                    enabled = true,
                    max_count = 3,
                },

                -- Diagnostic code for diagnostics (e.g., SC2022)
                show_code = true,

                throttle = 20,

                softwrap = 40,
            },
        })

        vim.diagnostic.config({ virtual_text = false })
    end,
}
