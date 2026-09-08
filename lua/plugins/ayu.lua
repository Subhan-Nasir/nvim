return {
    "Luxed/ayu-vim",
    enabled = false,
    priority = 1000,
    config = function()
        vim.cmd([[colorscheme ayu]])
    end,
}
