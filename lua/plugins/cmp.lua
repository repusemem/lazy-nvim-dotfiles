return {
    {
        "hrsh7th/cmp-nvim-lsp",
    },

	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},

	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"onsails/lspkind.nvim",
		},
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")
            local ls = require('luasnip')
			require("luasnip.loaders.from_vscode").lazy_load()
            require("luasnip.loaders.from_lua").load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
			local cmp_select = { behavior = cmp.SelectBehavior.Select }

			cmp.setup({
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						local kind = lspkind.cmp_format({
							mode = "symbol_text",
							maxwidth = 50,
							symbol_map = { Copilot = "" },
						})(entry, vim_item)

						local strings = vim.split(kind.kind, "%s", { trimempty = true })

						kind.kind = " " .. (strings[1] or "") .. " "
						kind.menu = "    (" .. (strings[2] or "") .. ")"

						return kind
					end,
				},

				window = {
					completion = cmp.config.window.bordered({
						border = "single",
						winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
						col_offset = -3,
						side_padding = 0,
					}),
					documentation = cmp.config.window.bordered({
						border = "single",
						winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
					}),
				},

				mapping = cmp.mapping.preset.insert({
					["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-k>"] = cmp.mapping(function(fallback)
                        if ls.expand_or_jumpable() then
                            ls.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    -- Ctrl + j: Nhảy lùi (Prev)
                    ["<C-j>"] = cmp.mapping(function(fallback)
                        if ls.jumpable(-1) then
                            ls.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
				}),

				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},

				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				},
			})
		end,
	},
}
