return {
    "karb94/neoscroll.nvim",
    enabled = true,
    config = function ()
        require("neoscroll").setup({
            duration_multiplier = 0.25,
            easing="linear"
        })
    end
}
