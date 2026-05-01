return {
    "dlyongemallo/diffview.nvim",
    version = "*",
    opts = {
        file_panel = {
            listing_style = "list"
        }
    },
    keys = {
        { "<leader>D", "<cmd>DiffviewToggle<cr>", mode = {"n"}, desc = "Toggle Diffview" },
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
