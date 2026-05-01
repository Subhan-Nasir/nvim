return {
    "dlyongemallo/diffview.nvim",
    version = "*",
    opts = {
        file_panel = {
            listing_style = "list"
        }
    },
    keys = {
        { "n", "<leader>D", "<cmd>DiffviewToggle<cr>" },
    },
    -- optional: lazy-load on command
    -- cmd = {
    --     "DiffviewOpen",
    --     "DiffviewToggle",
    --     "DiffviewFileHistory",
    --     "DiffviewDiffFiles",
    --     "DiffviewLog",
    -- },
}
