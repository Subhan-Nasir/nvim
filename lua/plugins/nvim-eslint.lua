return {
    "esmuellert/nvim-eslint",
    config = function()
        require("nvim-eslint").setup({
            settings = {
                validate = "off",
                format = true,
                experimental = {
                    -- use_flat_config = true
                    useFlatConfig = true
                }
            }
        })
    end,
}
