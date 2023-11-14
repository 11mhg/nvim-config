return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = true,
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			background = {
				light = "latte",
				dark = "mocha",
			},
			compile_path = vim.fn.stdpath "cache" .. "/catppuccin",
			transparent_background = false,
			show_end_of_buffer = false,
			term_colors = false,
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
				keywords = { "bold" },
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
			},
			color_overrides = {},
			custom_highlights = {},
			integrations = {
				cmp = true,
				dap = { enabled = true, enable_ui = true },
				gitsigns = true,
				neotree = true,
				treesitter = true,
				notify = false,
				mason = true,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
				--which_key = true,
			},
		})

		vim.cmd.colorscheme("catppuccin")
	end
}
