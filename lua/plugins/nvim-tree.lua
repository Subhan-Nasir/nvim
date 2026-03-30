return {
    "nvim-tree/nvim-tree.lua",
    enabled = true,
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        {
            "<leader>e",
            function()
                require("nvim-tree.api").tree.toggle(false, true)
            end,
            desc = "Toggle nvim tree",
        },
    },
    config = function()
        require("nvim-tree").setup({
            disable_netrw = true,
            hijack_netrw = true,
            open_on_tab = false,
            hijack_cursor = false,
            update_cwd = true,
            hijack_directories = {
                enable = true,
                auto_open = true,
            },
            diagnostics = {
                enable = true,
            },
            update_focused_file = {
                enable = true,
                update_cwd = false,
                ignore_list = {},
            },
            git = {
                enable = true,
                ignore = true,
                timeout = 500,
            },
            view = {
                width = 45,
                side = "left",
                -- mappings = {
                --     custom_only = false,
                --     list = {
                --         { key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
                --         { key = "h", cb = tree_cb("close_node") },
                --         { key = "v", cb = tree_cb("vsplit") },
                --     },
                -- },
                number = false,
                relativenumber = false,
            },
            renderer = {
                highlight_git = true,
                root_folder_modifier = ":t",
                icons = {
                    show = {
                        file = true,
                        folder = true,
                        folder_arrow = true,
                        git = true,
                    },
                    glyphs = {
                        default = "",
                        symlink = "",
                        -- git = {
                        --     unstaged = "",
                        --     staged = "S",
                        --     unmerged = "",
                        --     renamed = "➜",
                        --     deleted = "",
                        --     untracked = "U",
                        --     ignored = "◌",
                        -- },
                        git = {
                            deleted = "",
                            ignored = "◌",
                            renamed = "➜",
                            staged = "✓",
                            unmerged = "",
                            -- unstaged = "✗",
                            unstaged = "",
                            -- untracked = "★",
                            untracked = "",
                        },
                        folder = {
                            default = "",
                            open = "",
                            empty = "",
                            empty_open = "",
                            symlink = "",
                        },
                    },
                },
            },
        })

        -- -- Open nvim-tree on startup
        -- vim.api.nvim_create_autocmd("VimEnter", {
        --     callback = function()
        --         require("nvim-tree.api").tree.open()
        --         -- Move focus back to buffer
        --         vim.cmd("wincmd p")
        --     end,
        -- })

        -- When a quickfix window closes, prevent nvim-tree from stealing focus
        vim.api.nvim_create_autocmd('WinClosed', {
          callback = function(e)
            local winid = tonumber(e.match)
            local ok, bufnr = pcall(vim.api.nvim_win_get_buf, winid)
            if ok and vim.api.nvim_buf_is_valid(bufnr) and vim.bo[bufnr].buftype == 'quickfix' then
              vim.defer_fn(function()
                local cur_buf = vim.api.nvim_get_current_buf()
                if vim.bo[cur_buf].filetype == 'NvimTree' then
                  vim.cmd('wincmd p')
                end
              end, 10)
            end
          end
        })

        -- Make :bd and :q behave as usual when tree is visible
        vim.api.nvim_create_autocmd({'BufEnter', 'QuitPre'}, {
          nested = false,
          callback = function(e)
            local tree = require('nvim-tree.api').tree

            -- Nothing to do if tree is not opened
            if not tree.is_visible() then
              return
            end

            -- How many focusable windows do we have? (excluding e.g. incline status window)
            local winCount = 0
            for _,winId in ipairs(vim.api.nvim_list_wins()) do
              if vim.api.nvim_win_get_config(winId).focusable then
                winCount = winCount + 1
              end
            end

            -- We want to quit and only one window besides tree is left
            if e.event == 'QuitPre' and winCount == 2 then
            --   vim.api.nvim_cmd({cmd = 'qall'}, {})
              tree.close()
            end

            -- :bd was probably issued an only tree window is left
            -- Behave as if tree was closed (see `:h :bd`)
            if e.event == 'BufEnter' and winCount == 1 then
              -- Required to avoid "Vim:E444: Cannot close last window"
              vim.defer_fn(function()
                -- close nvim-tree: will go to the last buffer used before closing
                tree.toggle({find_file = true, focus = true})
                -- re-open nivm-tree
                tree.toggle({find_file = true, focus = false})
              end, 10)
            end
          end
        })

    end,
}
