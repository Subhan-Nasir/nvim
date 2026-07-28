return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    enabled = true,
    config = function()
        require("gruvbox").setup({
            terminal_colors = true,
            contrast = "hard",
            bold = true,
            italic = {
                strings = false,
                emphasis = false,
                comments = false,
                operators = false,
                folds = false,
            },
            transparent_mode = false,
            overrides = {
                SignColumn = { bg = "NONE" },
                CursorLineNr = { bg = "NONE" },
                WinSeparator = { fg = "#363636" },
                CurSearch = {
                    bg = "#8300e8",
                    fg = "#FFFFFF",
                },
                IncSearch = {
                    fg = "#8300e8",
                    bg = "#FFFFFF",
                }
            },
        })

        vim.cmd([[colorscheme gruvbox]])
    end,
    opts = {},
}
