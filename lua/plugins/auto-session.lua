return {
    'rmagatti/auto-session',
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
        no_restore_cmds = {
            function()
                -- load oil in case we're launching with a dir arg and there's no session
                require('oil')
            end,
        },
    },
}
