return {
    "esmuellert/nvim-eslint",
    config = function()
        require("nvim-eslint").setup({
            settings = {
                format = true,
                experimental = {
                    -- use_flat_config = true
                    useFlatConfig = true
                }
            }
        })
    end,
}
