vim.opt.termguicolors = true
vim.opt.background="dark"
vim.api.nvim_command("packadd cfilter")

require("config.lazy")
require("config.options")
require("config.keymaps")
