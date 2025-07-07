return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {
    },
    config = function()
        require("fzf-lua").setup({
            winopts = {
                border = "bold",
                -- border = "solid",
                width = 0.90,
                preview = {
                    horizontal = "right:50%",
                    -- border = "bold"
                    border = "solid"
                }
            },

        })
    end,
    keys = {
        {
            "<leader>sf",
            function() require("fzf-lua").files() end,
            desc = "Find file"
        },
        {
            "<leader>sg",
            function() require("fzf-lua").live_grep() end,
            desc = "Grep files"
        },
        {
            "<leader>sb",
            function() require("fzf-lua").buffers() end,
            desc = "Find buffer"
        },
        {
            "<leader>sl",
            function() require("fzf-lua").lgrep_curbuf() end,
            desc = "Live grep current buffer"
        },
        {
            "<leader>ss",
            function() require("fzf-lua").lsp_document_symbols() end,
            desc = "Find symbol in document"
        },
        {
            "<leader>sw",
            function() require("fzf-lua").lsp_workspace_symbols() end,
            desc = "Find symbol in workspace"
        },
        {
            "<leader>sz",
            function() require("fzf-lua").builtin() end,
            desc = "Search all fuzzy finders"
        },
    }
}
