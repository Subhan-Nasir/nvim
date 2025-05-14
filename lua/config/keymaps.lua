vim.keymap.set("i", "<a-3>", "#")

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Move selection up and down
vim.keymap.set("n", "<s-j>", ":m .+1<CR>==") -- move line up(n)
vim.keymap.set("n", "<s-k>", ":m .-2<CR>==") -- move line down(n)
vim.keymap.set("v", "<s-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
vim.keymap.set("v", "<s-k>", ":m '<-2<CR>gv=gv") -- move line down(v)


vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

vim.keymap.set("n", "]b", "<CMD>bn<CR>", {silent = true, desc = "Next buffer"})
vim.keymap.set("n", "[b", "<CMD>bp<CR>", {silent = true, desc = "Next buffer"})
vim.keymap.set("n", "<leader>bd", "<CMD>bd<CR>", {silent = true, desc = "Close buffer"})

vim.keymap.set({"n", "v"}, "<leader>/", "gcc", {remap = true})

-- Using `ggVG` adds an extra new line when pasting
vim.keymap.set("n", "<leader>va", "G$vgg0", {desc = "Select entire file"})




vim.api.nvim_create_autocmd(
    "LspAttach",
    { --  Use LspAttach autocommand to only map the following keys after the language server attaches to the current buffer
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
            vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc" -- Enable completion triggered by <c-x><c-o>

            -- Buffer local mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            local opts = { buffer = ev.buf }
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
            vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

            vim.keymap.set("n", "<leader>f", function()
                vim.lsp.buf.format({ async = true })
            end, opts)

            -- Open the diagnostic under the cursor in a float window
            vim.keymap.set("n", "<leader>d", function()
                vim.diagnostic.open_float({
                    border = "rounded",
                })
            end, opts)
        end,
    }
)
