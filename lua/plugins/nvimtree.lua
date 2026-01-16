return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            actions = {
                open_file = {
                    quit_on_open = false,
                },
            },

            hijack_netrw = true,
            hijack_directories = {
                enable = true,
                auto_open = true,
            },

            hijack_cursor = true,
        })
    end
}

