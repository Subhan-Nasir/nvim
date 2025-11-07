return {
    "esmuellert/nvim-eslint",
    config = function()
        require("nvim-eslint").setup({
            settings = {
                experimental = {
                    use_flat_config = true
                }
            }
        })
    end,
}
