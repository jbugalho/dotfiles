return {
	'nvim-telescope/telescope.nvim', tag = '0.1.5',
	-- or                              , branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{ "<leader>pf", function() require("telescope.builtin").find_files() end, desc = "Find Files" },
        { '<leader>pg', function() require("telescope.builtin").live_grep() end, desc = "Live Grep" },
        { '<leader>pb', function() require("telescope.builtin").buffers() end, desc = "Buffers" },
        { '<leader>ph', function() require("telescope.builtin").help_tags() end, desc = "Help tags" },
	}
}
