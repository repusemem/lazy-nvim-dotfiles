return { 
    "catppuccin/nvim", name = "catppuccin", priority = 1000,
    config = function()
        local base46_colors = {
            white = "#D9E0EE",
            darker_black = "#191828", -- Mantle
            black = "#1E1D2D",        -- Base (Nvim bg)
            black2 = "#252434",
            one_bg = "#2d2c3c",       -- Surface0
            one_bg2 = "#363545",
            one_bg3 = "#3e3d4d",
            grey = "#474656",
            grey_fg = "#4e4d5d",
            grey_fg2 = "#555464",
            light_grey = "#605f6f",
            red = "#F38BA8",
            baby_pink = "#ffa5c3",
            pink = "#F5C2E7",
            line = "#383747",
            green = "#ABE9B3",
            vibrant_green = "#b6f4be",
            nord_blue = "#8bc2f0",
            blue = "#89B4FA",
            yellow = "#FAE3B0",
            sun = "#ffe9b6",
            purple = "#d0a9e5",
            dark_purple = "#c7a0dc",
            teal = "#B5E8E0",
            orange = "#F8BD96",
            cyan = "#89DCEB",
            statusline_bg = "#232232",
            lightbg = "#2f2e3e",
            pmenu_bg = "#ABE9B3",
            folder_bg = "#89B4FA",
            lavender = "#c7d1ff",
        }

        require("catppuccin").setup({
            flavour = "mocha", 
            background = { 
                light = "latte",
                dark = "mocha",
            },
            transparent_background = false, 
            show_end_of_buffer = false, 
            term_colors = true, 
            dim_inactive = {
                enabled = false,
                shade = "dark",
                percentage = 0.15,
            },
            no_italic = false, 
            no_bold = false, 
            no_underline = false, 
            styles = { 
                comments = { "italic" },
                conditionals = { "italic" },
                loops = {},
                functions = {},
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
            },

            default_integrations = true,
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                treesitter = true,
                notify = false,
                mini = {
                    enabled = true,
                    indentscope_color = "",
                },
            },

            color_overrides = {
                mocha = {
                    base = base46_colors.black,        -- #1E1D2D
                    mantle = base46_colors.darker_black, -- #191828
                    surface0 = base46_colors.one_bg,   -- #2d2c3c
                    surface1 = base46_colors.one_bg2,  -- #363545
                    surface2 = base46_colors.one_bg3,  -- #3e3d4d

                    text = base46_colors.white,
                    subtext1 = base46_colors.grey_fg2,
                    subtext0 = base46_colors.grey_fg,
                    overlay2 = base46_colors.grey,
                    overlay1 = base46_colors.light_grey,

                    blue = base46_colors.blue,
                    lavender = base46_colors.lavender,
                    sapphire = base46_colors.nord_blue,
                    sky = base46_colors.cyan,
                    teal = base46_colors.teal,
                    green = base46_colors.green,
                    yellow = base46_colors.yellow,
                    peach = base46_colors.orange,
                    maroon = base46_colors.pink,
                    red = base46_colors.red,
                    mauve = base46_colors.purple,
                    flamingo = base46_colors.baby_pink,
                    rosewater = base46_colors.baby_pink,
                },
            },

            custom_highlights = function(colors)
                return {
                    ["@variable"] = { fg = base46_colors.lavender },
                    ["@property"] = { fg = base46_colors.teal },
                    ["@variable.builtin"] = { fg = base46_colors.red },

                    NormalFloat = { bg = "NONE" },
                    FloatBorder = { bg = "NONE" },

                    ["@punctuation.bracket"] = { fg = base46_colors.red }, 
                    ["@punctuation.delimiter"] = { fg = base46_colors.red },
                    ["@constructor"] = { fg = base46_colors.red },

                    Pmenu = { bg = "#11111b", fg = "#ffffff" },
                    PmenuSel = { bg = colors.blue, fg = "#000000" },

                    CmpItemAbbr = { fg = "NONE" },
                    CmpItemAbbrMatch = { fg = colors.sapphire, bold = true },
                    CmpItemAbbrMatchFuzzy = { fg = colors.sapphire, bold = true },

                    CmpItemMenu = { fg = colors.overlay2, italic = true },

                    CmpItemKind = { fg = colors.lavender },

                    FloatBorder = { fg = colors.blue, bg = "#11111b" },
                }
            end,
        })
        vim.cmd.colorscheme "catppuccin"
    end
}

