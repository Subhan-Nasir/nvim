return {
    {
        "devswiftzone/swift.nvim",
        ft = "swift",
        enabled = false,
        config = function()
            require("swift").setup({
                enabled = true,
                features = {
                    -- LSP Integration
                    lsp = {
                        enabled = false,
                        auto_setup = true, -- Automatically setup LSP
                        sourcekit_path = nil, -- Auto-detect if nil
                        inlay_hints = true, -- Enable inlay hints
                        semantic_tokens = true, -- Enable semantic tokens
                        on_attach = nil, -- Custom on_attach function
                        capabilities = nil, -- Custom capabilities
                        cmd = nil, -- Custom command
                        root_dir = nil, -- Custom root_dir function
                        filetypes = { "swift" },
                        settings = {},
                    },
                    linter = {
                        enabled = false
                    }
                },
            })
        end,
    },
}
