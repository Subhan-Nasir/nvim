return {
    "nvimdev/indentmini.nvim",
    enabled = false,
    config = function()
        require("indentmini").setup() -- use default config
        vim.cmd("hi default link IndentLine Comment")
    end,
}
