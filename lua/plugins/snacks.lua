return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        bigfile = { enabled = false },
        dashboard = { enabled = false },
        indent = { enabled = false },
        input = { enabled = false },
        notifier = { enabled = false },
        quickfile = { enabled = false },
        scope = { enabled = false },
        scroll = { enabled = false },
        statuscolumn = { enabled = false },
        words = { enabled = false },
        explorer = {
            enabled = true,
        },
        picker = {
            enabled = true,
            sources = {
                explorer = {
                    layout = {
                        layout = {
                            position = "left"
                        }
                    },
                    follow_file = true,
                    tree = true,
                    focus = "list",
                    enter = false,
                    replace_netrw = true,
                    auto_close = false
                }
            }
        },
    },
    keys = {
        { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
    }
}
