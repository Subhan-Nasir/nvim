vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.cursorline = true

vim.wo.signcolumn = "yes"

vim.opt.termguicolors = true

vim.opt.scrolloff= 5

-- vim.opt.list = true

vim.diagnostic.config({
    virtual_text = true,
    underline = true
})

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
