vim.opt.nu = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.g.fast_cursor_move_acceleration = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.equalalways = true

vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = { "*.inp", "*.out", "*.ans" },
    callback = function()
        vim.opt_local.winfixwidth = true
    end,
})

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = 'yes' 

vim.opt.updatetime = 50
