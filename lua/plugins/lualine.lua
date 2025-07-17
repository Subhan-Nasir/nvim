return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons","arkav/lualine-lsp-progress"},
        config = function()
            require("lualine").setup({
                options = {
                    theme = "onedark",
                    -- component_separators = { left = "", right = ""},
                    -- section_separators = { left = "", right = ""},
                    component_separators = { left = " ", right = " "},
                    section_separators = { left = " ", right = " "},
                },
                sections = {
                    lualine_c = {
                        "lsp_progress"
                    }
                }
            })
        end
    },
}
