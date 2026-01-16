return {
    'akinsho/toggleterm.nvim', 
    version = "*",
    config = function()
        require("toggleterm").setup({
            size = function(term)
                if term.direction == "horizontal" then
                    return vim.o.lines * 0.2
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,

            open_mapping = [[<c-\>]],
            hide_numbers = true, 
            shade_filetypes = {},
            shade_terminals = true,
            start_in_insert = true, 
            insert_mappings = true, 
            persist_size = true,

            direction = 'horizontal',

            close_on_exit = false, 
            auto_scroll = true,
            shell = vim.o.shell, 
        })

        function _G.set_terminal_keymaps()
            local opts = {buffer = 0}

            vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts) 
            vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts) 
            vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts) 
            vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts) 

            vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
        end

        vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

        local function run_python_file()
            vim.cmd("wa")
            local file = vim.fn.expand("%")
            local cmd = "clear && python -u " .. file

            require("toggleterm").exec(cmd, 1, 12, nil, "horizontal", "python_runner", false)
        end

        vim.keymap.set("n", "<leader>rpy", run_python_file, { desc = "Run Python in ToggleTerm" })
    end
}
