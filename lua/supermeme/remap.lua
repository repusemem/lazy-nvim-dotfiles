vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>rpy", ":wa<CR>:!python %<CR>")
vim.keymap.set("i", "<C-BS>", "<C-w>")
vim.keymap.set({"v", "n"}, "<leader>y", '"+y')
vim.keymap.set({"v", "n"}, "<leader>p", '"+p')

vim.opt.clipboard = 'unnamedplus'

vim.keymap.set("n", "<C-p>", ":Telescope  find_files<CR>")
vim.keymap.set("n", "<C-b>", ":NvimTreeFindFileToggle<CR>")

vim.keymap.set("n", "<leader>bp", ":bp<CR>")
vim.keymap.set("n", "<leader>bn", ":bn<CR>")
vim.keymap.set("n", "<leader>bd", ":bd<CR>")

vim.keymap.set("n", "<leader>md", ":MarkdownPreviewToggle<CR>")
vim.keymap.set("v", "<leader>cm", ":CommentToggle<CR>")
