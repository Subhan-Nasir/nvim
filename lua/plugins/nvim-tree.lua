return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    enabled = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { "<leader>e", "<cmd>NvimTreeToggle show<cr>" }
    },
    config = function()
        require("nvim-tree").setup({
            disable_netrw = true,
            hijack_directories = {
                enable = false
            },
            filters = {
                dotfiles = false
            },
            renderer = {
                add_trailing = true,
            },
            actions = {
                open_file = {
                    quit_on_open = true,
                },
            },
            view = {
                width = 45
            }
        });

    end,
}
