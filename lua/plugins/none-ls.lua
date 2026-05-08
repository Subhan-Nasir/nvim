return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local null_ls = require("null-ls")

        local substitutions = {
            { pat = "\xe2\x80\x93", rep = "-", msg = "En dash (U+2013) - use ASCII hyphen '-'" },
            { pat = "\xe2\x80\x94", rep = "-", msg = "Em dash (U+2014) - use ASCII hyphen '-'" },
            { pat = "\xe2\x80\x95", rep = "-", msg = "Horizontal bar (U+2015) - use ASCII hyphen '-'" },
            { pat = "\xe2\x80\x98", rep = "'", msg = 'Left single quote (U+2018) - use ASCII quote "\'"' },
            { pat = "\xe2\x80\x99", rep = "'", msg = 'Right single quote (U+2019) - use ASCII quote "\'"' },
            { pat = "\xe2\x80\x9c", rep = '"', msg = "Left double quote (U+201C) - use ASCII quote '\"'" },
            { pat = "\xe2\x80\x9d", rep = '"', msg = "Right double quote (U+201D) - use ASCII quote '\"'" },
            { pat = "\xe2\x80\x9e", rep = '"', msg = "Low double quote (U+201E) - use ASCII quote '\"'" },
            { pat = "\xe2\x80\x9f", rep = '"', msg = "High double quote (U+201F) - use ASCII quote '\"'" },
        }

        local unicode_diagnostics = {
            name = "unicode-substitutions",
            method = null_ls.methods.DIAGNOSTICS,
            filetypes = {},
            generator = {
                fn = function(params)
                    local diagnostics = {}
                    for i, line in ipairs(params.content) do
                        for _, sub in ipairs(substitutions) do
                            local col = 1
                            while true do
                                local s, e = line:find(sub.pat, col, true)
                                if not s then
                                    break
                                end
                                table.insert(diagnostics, {
                                    row = i,
                                    col = s - 1,
                                    end_col = e,
                                    message = sub.msg,
                                    severity = vim.diagnostic.severity.WARN,
                                    source = "unicode-substitutions",
                                })
                                col = e + 1
                            end
                        end
                    end
                    return diagnostics
                end,
            },
        }

        local unicode_code_actions = {
            name = "unicode-substitutions",
            method = null_ls.methods.CODE_ACTION,
            filetypes = {},
            generator = {
                fn = function(params)
                    local actions = {}

                    -- First match on the cursor's line at or after the cursor column
                    local cursor_line = params.content[params.row]
                    local cursor_match = nil
                    if cursor_line then
                        local best = nil
                        for _, sub in ipairs(substitutions) do
                            local s, e = cursor_line:find(sub.pat, params.col + 1, true)
                            if s and (best == nil or s < best.s) then
                                best = { row = params.row, s = s, e = e, sub = sub }
                            end
                        end
                        cursor_match = best
                    end

                    if cursor_match then
                        table.insert(actions, {
                            title = "Replace this unicode substitution",
                            action = function()
                                local line = params.content[cursor_match.row]
                                local new_line = line:sub(1, cursor_match.s - 1) .. cursor_match.sub.rep .. line:sub(cursor_match.e + 1)
                                vim.api.nvim_buf_set_lines(params.bufnr, cursor_match.row - 1, cursor_match.row, false, { new_line })
                            end,
                        })
                    end

                    local has_any = cursor_match ~= nil
                    if not has_any then
                        for _, line in ipairs(params.content) do
                            for _, sub in ipairs(substitutions) do
                                if line:find(sub.pat, 1, true) then
                                    has_any = true
                                    break
                                end
                            end
                            if has_any then
                                break
                            end
                        end
                    end

                    if has_any then
                        table.insert(actions, {
                            title = "Replace all unicode substitutions",
                            action = function()
                                for i, line in ipairs(params.content) do
                                    local new_line = line
                                    for _, sub in ipairs(substitutions) do
                                        new_line = new_line:gsub(sub.pat, sub.rep)
                                    end
                                    if new_line ~= line then
                                        vim.api.nvim_buf_set_lines(params.bufnr, i - 1, i, false, { new_line })
                                    end
                                end
                            end,
                        })
                    end

                    return actions
                end,
            },
        }

        null_ls.setup({
            should_attach = function()
                return true
            end,
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.shfmt,
                -- null_ls.builtins.formatting.prettier,
                -- require("none-ls.diagnostics.eslint_d")
                unicode_diagnostics,
                unicode_code_actions,
            },
        })
        -- vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}

