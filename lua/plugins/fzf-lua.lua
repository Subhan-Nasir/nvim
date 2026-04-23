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

        vim.api.nvim_set_hl(0, "FzfLuaTitle", { fg = "#1d2021", bg = "#f38ba8", bold = true })
        vim.api.nvim_set_hl(0, "FzfLuaPreviewTitle", { fg = "#1d2021", bg = "#a6e3a1", bold = true })
        vim.api.nvim_set_hl(0, "FzfLuaFzfPrompt", { fg = "#f38ba8" })
        vim.api.nvim_set_hl(0, "FzfLuaPreviewNormal", { bg = "#282828" })
        vim.api.nvim_set_hl(0, "FzfLuaPreviewBorder", { fg = "#282828", bg = "#282828" })

        require("fzf-lua").setup({
            fzf_opts = {
                ["--padding"] = "2,0",
            },
            winopts = {
                -- border = "bold",
                border = "solid",
                width = 0.90,
                preview = {
                    horizontal = "right:60%",
                    -- border = "bold"
                    border = "solid",
                    title_pos = "center",
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
            desc = "Search all commands",
        },
    },
}
