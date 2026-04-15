return {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    opts = {
        keymap = {
            preset = "enter",
            ["<CR>"] = { "accept", "fallback" },
            ["<Tab>"] = { "accept", "fallback" },
            ["<a-j>"] = { "select_next", "fallback" },
            ["<a-k>"] = { "select_prev", "fallback" },
            ["<C-Space>"] = { "show", "fallback" },
            ["<C-e>"] = { "hide" },
        },
        -- highlight = {
        --     use_nvim_cmp_as_default = true,
        -- },
        appearance = {
            nerd_font_variant = 'mono'
        },
        completion = {
            ghost_text = { enabled = false },
            -- Only auto-select when there is one unambiguous match
            list = { selection = { preselect = true, auto_insert = false } },
            trigger = { show_on_keyword = true, show_on_trigger_character = true },
            menu = {
                auto_show = true,
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500,
            },
            accept = {
                auto_brackets = {
                    enabled = true,
                    override_brackets_for_filetypes = {
                        css = { "", "" },
                        scss = { "", "" },
                        less = { "", "" },
                    },

                }
            }
        },
        sources = {
            default = { "lazydev", "lsp", "path", "snippets", "buffer" },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
                lsp = {
                    score_offset = 50,
                    min_keyword_length = function(ctx)
                        return ctx.trigger.kind == 'manual' and 0 or 1
                    end,
                },
                snippets = {
                    min_keyword_length = function(ctx)
                        return ctx.trigger.kind == 'manual' and 0 or 3
                    end,
                    score_offset = -10,
                },
                path = {
                    min_keyword_length = function(ctx)
                        return ctx.trigger.kind == 'manual' and 0 or 2
                    end,
                },
                buffer = {
                    min_keyword_length = function(ctx)
                        return ctx.trigger.kind == 'manual' and 0 or 4
                    end,
                    score_offset = -20
                }
            },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
}
