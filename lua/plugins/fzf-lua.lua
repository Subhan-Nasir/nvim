---@diagnostic disable: missing-fields
return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {},
    event = "VeryLazy",
    config = function()
        require("fzf-lua").register_ui_select()
        require("fzf-lua").setup({
            winopts = {
                -- border = "bold",
                border = "solid",
                width = 0.90,
                preview = {
                    horizontal = "right:50%",
                    -- border = "bold"
                    border = "solid",
                },
            },
            keymap = {
                fzf = {
                    ["ctrl-q"] = "select-all+accept",
                },
            },
            files = {
                git_icons = true,
            },
            lsp = {
                code_actions = {
                    previewer = "codeaction_native",
                    preview_pager = "delta --width=$FZF_PREVIEW_COLUMNS --hunk-header-style=omit --file-style=omit",
                },
            },
        })
    end,
    keys = {
        {
            "<leader>sf",
            function()
                require("fzf-lua").files()
            end,
            desc = "Find file",
        },
        {
            "<leader>sg",
            function()
                local utils = require("config.utils")
                local selection = utils.get_visual_selection()

                require("fzf-lua").live_grep({
                    rg_glob = true,
                    no_esc = true,
                    search = selection[1],
                })
            end,
            mode = "v",
            desc = "Grep files",
        },
        {
            "<leader>sg",
            function()
                require("fzf-lua").live_grep({
                    rg_glob = true,
                    no_esc = true,
                })
            end,
            mode = "n",
            desc = "Grep files",
        },
        -- {
        --     "<leader>sb",
        --     function() require("fzf-lua").buffers() end,
        --     desc = "Find buffer"
        -- },
        {
            "<leader>t",
            function()
                require("fzf-lua").buffers()
            end,
            desc = "Find buffer",
        },
        {
            "<leader>sl",
            function()
                require("fzf-lua").lgrep_curbuf()
            end,
            mode = "n",
            desc = "Live grep current buffer",
        },
        {
            "<leader>sl",
            function()
                local utils = require("config.utils")
                local selection = utils.get_visual_selection()
                require("fzf-lua").lgrep_curbuf({
                    search = selection[1]
                })
            end,
            mode = "v",
            desc = "Live grep current buffer",
        },
        {
            "<leader>ss",
            function()
                require("fzf-lua").lsp_document_symbols()
            end,
            desc = "Find symbol in document",
        },
        {
            "<leader>sw",
            function()
                require("fzf-lua").lsp_workspace_symbols()
            end,
            desc = "Find symbol in workspace",
        },
        {
            "<leader>sz",
            function()
                require("fzf-lua").builtin()
            end,
            desc = "Search all fuzzy finders",
        },
        {
            "<leader>sc",
            function()
                require("fzf-lua").commands()
            end,
            desc = "Search all fuzzy finders",
        },
    },
}
