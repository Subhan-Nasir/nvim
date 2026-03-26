return {
    "folke/snacks.nvim",
    priority = 1000,
    enabled = false,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        bigfile = { enabled = false },
        dashboard = { enabled = false },
        indent = { enabled = false },
        input = { enabled = true },
        notifier = { enabled = false },
        quickfile = { enabled = false },
        scope = { enabled = false },
        scroll = { enabled = false },
        statuscolumn = { enabled = false },
        words = { enabled = false },
        explorer = {
            enabled = true,
            auto_hide = { "input" }
        },
        picker = {
            enabled = true,
            hidden = true,
            sources = {
                explorer = {
                    layout = {
                        layout = {
                            position = "left"
                        },
                        auto_hide = { "input" }
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
        { "<leader>e", function() Snacks.explorer({auto_hide = {"input"}}) end, desc = "File Explorer" },
        -- {
        --     "<leader>bd",
        --     function()
        --         local exp = Snacks.picker.get({ source = "explorer" })[1]
        --         if exp ~= nil and exp.closed ~= true then
        --             exp:close()
        --             vim.cmd("bd")
        --         else
        --             vim.cmd("bd")
        --         end

        --     end,
        --     desc = "File Explorer"
        -- },
    }
}
