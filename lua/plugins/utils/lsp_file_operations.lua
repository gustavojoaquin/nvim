return {
	'antosha417/nvim-lsp-file-operations',
	-- lazy will handle loading nvim-tree and neo-tree appropriately based on the module load and our `init` function
	lazy = true,
	-- lazily load plugin after a tree plugin is loaded
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-neo-tree/neo-tree.nvim',
	},
	opts = {},
}
