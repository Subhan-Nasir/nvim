return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", "arkav/lualine-lsp-progress" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "onedark",
                    -- component_separators = { left = "", right = ""},
                    -- section_separators = { left = "", right = ""},
                    component_separators = { left = " ", right = " " },
                    section_separators = { left = " ", right = " " },
                },
                sections = {
                    lualine_c = {
                        "lsp_progress",
                    },
                    lualine_x = {
                        {
                            function()
                                local ok, tm = pcall(require, "swift.features.target_manager")
                                if ok and vim.bo.filetype == "swift" then
                                    return tm.statusline_detailed()
                                end
                                return ""
                            end,
                            color = { fg = "#ff6b00" },
                        },
                        "encoding",
                        "filetype",
                    },
                },
            })
        end,
    },
}
