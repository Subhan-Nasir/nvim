return {
    "rockyzhang24/arctic.nvim",
    enabled = true,
    dependencies = { "rktjmp/lush.nvim" },
    name = "arctic",
    branch = "main",
    priority = 1000,
    config = function()
        vim.cmd("colorscheme arctic")
    end
}
