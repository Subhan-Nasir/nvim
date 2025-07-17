-- disable netrw 
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.backspace = { "start", "eol", "indent" }


vim.opt.cursorline = true

vim.opt.scrolloff = 5


vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.hlsearch = true
vim.opt.ignorecase = true

vim.cmd.highlight('IndentLine guifg=#636363')
vim.cmd.highlight('IndentLineCurrent guifg=#D3D3D3')

-- vim.opt.list = true

vim.diagnostic.config({
    virtual_text = true,
    underline = true
})

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('highlight_yank', {}),
    desc = 'Hightlight selection on yank',
    pattern = '*',
    callback = function()
        vim.highlight.on_yank { higroup = 'IncSearch', timeout = 300 }
    end,
})
