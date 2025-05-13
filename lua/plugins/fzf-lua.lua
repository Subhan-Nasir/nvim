return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {},
    keys = {
        {
            "<leader>ff",
            function() require("fzf-lua").files() end,
            desc = "Find file"
        },
        {
            "<leader>fg",
            function() require("fzf-lua").live_grep() end,
            desc = "Grep files"
        },
        {
            "<leader>fb",
            function() require("fzf-lua").buffers() end,
            desc = "Find buffer"
        },
        {
            "<leader>fl",
            function() require("fzf-lua").lgrep_curbuf() end,
            desc = "Live grep current buffer"
        },
        {
            "<leader>fs",
            function() require("fzf-lua").lsp_document_symbols() end,
            desc = "Find symbol in document"
        },
        {
            "<leader>fw",
            function() require("fzf-lua").lsp_workspace_symbols() end,
            desc = "Find symbol in workspace"
        },
        {
            "<leader>fz",
            function() require("fzf-lua").builtin() end,
            desc = "Search all fuzzy finders"
        },
    }
}
