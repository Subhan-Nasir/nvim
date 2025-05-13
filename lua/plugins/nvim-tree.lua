return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        {"<leader>e", "<cmd>NvimTreeToggle<cr>"}
    },
    config = function()
        require("nvim-tree").setup({
            hijack_directories = {
                enable = false
            },
            filters = {
                dotfiles = false
            },
            renderer = {
                add_trailing = true,
            }
        })
    end,
}
