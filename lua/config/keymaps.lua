vim.keymap.set("i", "<a-3>", "#")
vim.keymap.set('i', '<a-BS>', '<C-W>', { noremap = true })


vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Move selection up and down
vim.keymap.set("n", "<s-j>", ":m .+1<CR>==")     -- move line up(n)
vim.keymap.set("n", "<s-k>", ":m .-2<CR>==")     -- move line down(n)
vim.keymap.set("v", "<s-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
vim.keymap.set("v", "<s-k>", ":m '<-2<CR>gv=gv") -- move line down(v)

-- Resize with arrow keys
vim.keymap.set("n", "<C-s-Up>", ":resize +2<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<C-s-Down>", ":resize -2<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<C-s-Left>", ":vertical resize -2<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<C-s-Right>", ":vertical resize +2<CR>", {noremap = true, silent = true})


vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- vim.keymap.set("n", "]b", "<CMD>bn<CR>", { silent = true, desc = "Next buffer" })
-- vim.keymap.set("n", "[b", "<CMD>bp<CR>", { silent = true, desc = "Next buffer" })

vim.keymap.set("n", "<tab>", "<CMD>bn<CR>", { silent = true, desc = "Next buffer" })
vim.keymap.set("n", "<s-tab>", "<CMD>bp<CR>", { silent = true, desc = "Next buffer" })


-- vim.keymap.set("n", "<leader>bd", "<CMD>bd<CR>", { silent = true, desc = "Close buffer" })

vim.keymap.set({ "n", "v" }, "<leader>/", "gcc", { remap = true })

-- Using `ggVG` adds an extra new line when pasting
vim.keymap.set("n", "<leader>va", "G$vgg0", { desc = "Select entire file" })




vim.api.nvim_create_autocmd(
    "LspAttach",
    { --  Use LspAttach autocommand to only map the following keys after the language server attaches to the current buffer
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
            vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc" -- Enable completion triggered by <c-x><c-o>

            -- Buffer local mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            -- local opts = { buffer = ev.buf }

            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action,
                { buffer = ev.buf, desc = "Code actions" })

            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "Go to definition" })
            vim.keymap.set("n", "<leader>gD", vim.lsp.buf.type_definition,
                { buffer = ev.buf, desc = "Go to type definition" })
            vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation,
                { buffer = ev.buf, desc = "Go to implementation" })
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { buffer = ev.buf, desc = "Go to references" })

            vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, { buffer = ev.buf, desc = "Hover" })
            vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename variable" })

            vim.keymap.set({ "n", "v" }, "<leader>cf",
                function()
                    vim.lsp.buf.format({ async = true })
                end,
                { buffer = ev.buf, desc = "Code Format" }
            )

            -- Open the diagnostic under the cursor in a float window
            vim.keymap.set("n", "<leader>d", function()
                vim.diagnostic.open_float({
                    border = "rounded",
                })
            end, { buffer = ev.buf, desc = "Open diagnostics under the cursor" })
        end,
    }
)

--- This function is taken directly from [LazyVim's UI utils](https://github.com/LazyVim/LazyVim/blob/a1c3ec4cd43fe61e3b614237a46ac92771191c81/lua/lazyvim/util/ui.lua#L228).
--- Besides some other nice features, this primarily prevents neo-tree from
--- taking up the whole screen after deleting a buffer.
--- (Thank you folke)
---@param buf number?
local function bufremove(buf)
    buf = buf or 0
    buf = buf == 0 and vim.api.nvim_get_current_buf() or buf

    if vim.bo.modified then
        local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
        if choice == 0 or choice == 3 then -- 0 for <Esc>/<C-c> and 3 for Cancel
            return
        end
        if choice == 1 then -- Yes
            vim.cmd.write()
        end
    end

    for _, win in ipairs(vim.fn.win_findbuf(buf)) do
        vim.api.nvim_win_call(win, function()
            if not vim.api.nvim_win_is_valid(win) or vim.api.nvim_win_get_buf(win) ~= buf then
                return
            end
            -- Try using alternate buffer
            local alt = vim.fn.bufnr("#")
            if alt ~= buf and vim.fn.buflisted(alt) == 1 then
                vim.api.nvim_win_set_buf(win, alt)
                return
            end

            -- Try using previous buffer
            local has_previous = pcall(vim.cmd, "bprevious")
            if has_previous and buf ~= vim.api.nvim_win_get_buf(win) then
                return
            end

            -- Create new listed buffer
            local new_buf = vim.api.nvim_create_buf(true, false)
            vim.api.nvim_win_set_buf(win, new_buf)
        end)
    end
    if vim.api.nvim_buf_is_valid(buf) then
        pcall(vim.cmd, "bdelete! " .. buf)
    end
end

vim.keymap.set("n", "<leader>bd", bufremove, { desc = "Delete Buffer (without breaking neotree)" })
