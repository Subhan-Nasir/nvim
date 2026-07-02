return {
    'numToStr/Comment.nvim',
    opts = {
        -- add any options here
    },
    config = function()
        require("Comment").setup({
            ignore = '^$'
        })
        vim.api.nvim_command('set commentstring=#%s')
    end
}

