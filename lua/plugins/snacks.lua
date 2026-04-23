return {
    "folke/snacks.nvim",
    priority = 1000,
    enabled = true,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        bigfile = { enabled = false },
        dashboard = { enabled = false },
        indent = { enabled = false },
        input = {
            enabled = true,
        },
        notifier = { enabled = false },
        quickfile = { enabled = false },
        scope = { enabled = false },
        scroll = { enabled = false },
        statuscolumn = { enabled = false },
        words = { enabled = false },
        explorer = {
            enabled = false,
            auto_hide = { "input" }
        },
        picker = {
            enabled = false,
            win = {
                input = {
                    keys = {
                        ["<a-j>"] = { "list_down", mode = { "i", "n" } },
                        ["<a-k>"] = { "list_up", mode = { "i", "n" } },
                        -- Iterm2 sends `a-b`/`a-f` on `option-left`/`option-right`
                        -- ["<a-BS>"] = { function() vim.api.nvim_input("<C-w>") end, mode = { "i" } },
                        -- ["<a-b>"] = { function() vim.api.nvim_input("<C-Left>") end, mode = { "i" } },
                        -- ["<a-f>"] = { function() vim.api.nvim_input("<C-Right>") end, mode = { "i" } },
                    },
                },
            },
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
    -- keys = {
    --     {
    --         "<leader>sf",
    --         function()
    --             Snacks.picker.files()
    --         end,
    --         desc = "Find files"
    --     },
    --     {
    --         "<leader>sg",
    --         function()
    --             Snacks.picker.grep()
    --         end,
    --         mode = {"n"},
    --         desc = "Grep files",
    --     },
    --     {
    --         "<leader>sg",
    --         function()
    --             Snacks.picker.grep_word()
    --         end,
    --         desc = "Grep visual selection",
    --         mode = { "v" }
    --     },
    --     {
    --         "<leader>t",
    --         function()
    --             Snacks.picker.buffers()
    --         end,
    --         desc = "Find buffer",
    --     },
    --     {
    --         "<leader>sl",
    --         function()

    --             ---@type snacks.picker.lines.Config
    --             local picker_config = {
    --                 layout = {
    --                     preset = "dropdown",
    --                     layout = {
    --                         height = 0.4
    --                     },
    --                 },
    --             }

    --             local utils = require("config.utils")
    --             local selection = utils.get_visual_selection()[1]

    --             if selection and selection ~= "" then
    --                 picker_config.search = selection
    --             end

    --             Snacks.picker.lines(picker_config)
    --         end,
    --         mode = {"v"},
    --         desc = "Live grep current buffer",
    --     },
    --     {
    --         "<leader>sl",
    --         function()
    --             Snacks.picker.lines({
    --                 layout = {
    --                     preset = "dropdown",
    --                     layout = {
    --                         height = 0.4
    --                     },
    --                 },
    --             })
    --         end,
    --         mode = {"n"},
    --         desc = "Live grep current buffer",
    --     },
    --     {
    --         "<leader>ss",
    --         function()
    --             Snacks.picker.lsp_symbols()
    --         end,
    --         desc = "Find symbol in document",
    --     },
    --     {
    --         "<leader>sw",
    --         function()
    --             Snacks.picker.lsp_workspace_symbols()
    --         end,
    --         desc = "Find symbol in workspace",
    --     },
    --     {
    --         "<leader>sz",
    --         function()
    --             Snacks.picker.pickers()
    --         end,
    --         desc = "Search all fuzzy finders",
    --     },
    --     {
    --         "<leader>sc",
    --         function()
    --             Snacks.picker.commands()
    --         end,
    --         desc = "Search all commands",
    --     }
    -- }
}
