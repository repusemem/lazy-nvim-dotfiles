return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-mini/mini.icons",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
        local alpha = require('alpha')
        local dashboard = require('alpha.themes.dashboard')

        dashboard.section.header.val = {
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                     ]],
            [[       ████ ██████           █████      ██                     ]],
            [[      ███████████             █████                             ]],
            [[      █████████ ███████████████████ ███   ███████████   ]],
            [[     █████████  ███    █████████████ █████ ██████████████   ]],
            [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
            [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
            [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[          _______  ______  ___  _________ ___  ___  ____ ___  ___ ]],
            [[         / ___/ / / / __ \/ _ \/ ___/ __ `__ \/ _ \/ __ `__ \/ _ \]],
            [[        (__  ) /_/ / /_/ /  __/ /  / / / / / /  __/ / / / / /  __/]],
            [[       /____/\__,_/ .___/\___/_/  /_/ /_/ /_/\___/_/ /_/ /_/\___/ ]],
            [[                 /_/                                              ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
        }
        dashboard.section.header.opts.position = 'center'

        dashboard.section.buttons.val = {
            dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
            dashboard.button("r", "  Recent", ":Telescope oldfiles <CR>"),
            dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
        }

        dashboard.section.footer.val = {}

        dashboard.section.header.opts.hl = "AlphaHeader"
        dashboard.section.buttons.opts.hl = "AlphaButtons"

        dashboard.config.layout = {
            { type = "padding", val = 2 },
            dashboard.section.header,
            { type = "padding", val = 2 },
            dashboard.section.buttons,
        }

        alpha.setup(dashboard.config)
	end,
}
