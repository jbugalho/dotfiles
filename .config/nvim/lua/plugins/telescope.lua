return {
	'nvim-telescope/telescope.nvim', tag = '0.1.5',
	-- or                              , branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{ "<leader>pf", function() require("telescope.builtin").find_files() end, desc = "Find Files" },
	}
}
