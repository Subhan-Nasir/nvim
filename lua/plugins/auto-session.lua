return {
    'rmagatti/auto-session',
    lazy = false,
    enabled = true,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
        close_filetypes_on_save = { 'oil', 'checkhealth', 'NvimTree' },

        pre_restore_cmds = {
            function()
                for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                    if vim.bo[buf].filetype == 'oil' then
                        vim.api.nvim_buf_delete(buf, { force = true })
                    end
                end
            end,
        },
        post_restore_cmds = {
            function()
                require('nvim-tree.api').tree.open()
                vim.cmd('wincmd p')
            end,
        },
        no_restore_cmds = {
            function()
                require('nvim-tree.api').tree.open()
                vim.cmd('wincmd p')
            end,
        },
    },
}
