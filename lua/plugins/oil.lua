return {
    {
        'stevearc/oil.nvim',
        cmd = "Oil",
        ---@module 'oil'
        ---@type oil.SetupOpts
        -- opts = {},
        -- Optional dependencies
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        -- lazy = false,
        config = function()
            require("oil").setup({
                default_file_explorer = true,
                delete_to_trash = true,
                skip_confirm_for_simple_edits = false,
                view_options = {
                    show_hidden = true,
                    natural_order = true,
                    -- is_always_hidden = function(name, _)
                    --     return name == '..' or name == '.git'
                    -- end,
                },
                win_options = {
                    wrap = true,
                }
            })
        end,
    }
}
