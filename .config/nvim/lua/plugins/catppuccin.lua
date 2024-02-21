return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	lazy = false,
    opts = {
      transparent_background = true,
    },
	config = function()
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
