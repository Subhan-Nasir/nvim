return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    config = function()
        local wk = require("which-key")
        wk.setup({})
        wk.add({
            { "<leader>g", group = "Go To" },
            { "<leader>c", group = "Code" },
            { "<leader>s", group = "Search" },
            { "<leader>x", group = "Diagnostics" },
            { "<leader>b", group = "Buffer" },
            { "<leader>v", group = "Visual/Select" },
        })
    end,
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}
