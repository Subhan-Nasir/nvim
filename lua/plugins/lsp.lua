return {
    {
        "williamboman/mason.nvim",
        lazy=false,
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "artemave/workspace-diagnostics.nvim",
        },
        opts = {
            servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                        },
                    },
                },
                ts_ls = {
                    on_attach = function(client, bufnr)
                        require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
                    end,
                },
                pylsp = {}
                -- angularls = {}
            },
        },
        config = function(_, opts)
            require("mason").setup()

            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ts_ls", "pylsp" },
                automatic_installation = false,
                automatic_enable = false
            })

            local lspconfig = require("lspconfig")

            for server, config in pairs(opts.servers) do
                vim.lsp.config(server, config)
                lspconfig[server].setup(config)
                -- vim.lsp.enable(server)
            end
        end,
    },
}


