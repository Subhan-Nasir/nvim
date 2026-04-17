return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    enabled = true,
    config = function()
        require("gruvbox").setup({
            terminal_colors = true,
            contrast = "hard",
            transparent_mode = false,
            overrides = {
                SignColumn = { bg = "NONE" },
                CursorLineNr = {bg = "NONE"},
                WinSeparator = {fg = "#363636"}
            }
        })
        vim.cmd([[colorscheme gruvbox]])
    end,
    opts = {},
}
