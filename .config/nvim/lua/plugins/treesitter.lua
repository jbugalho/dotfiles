return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function ()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"rust",
				"javascript",
				"html",
				"java",
				"kotlin",
				"json",
				"go",
				"gitcommit",
				"gitattributes",
				"git_rebase",
				"git_config",
				"fish",
				"dockerfile",
				"arduino",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end
}
