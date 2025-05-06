return {
	'nvim-neorg/neorg',
	lazy = true,
	version = '^8',
	dependencies = {
		'vhyrro/luarocks.nvim',
	},
	event = 'VeryLazy',
	opts = {
		load = {
			['core.defaults'] = {},  -- Loads default behaviour
			['core.concealer'] = {}, -- Adds pretty icons to your documents
			['core.keybinds'] = {},  -- Adds default keybindings
			['core.completion'] = {
				config = {
					engine = 'nvim-cmp',
				},
			},                     -- Enables support for completion plugins
			['core.journal'] = {}, -- Enables support for the journal module
			['core.dirman'] = {    -- Manages Neorg workspaces
				config = {
					workspaces = {
						notes = '/media/gus/proyectos/notes/',
						course = '/media/gus/Cursos/course_notes',
					},
				},
			},
		},
	},
}
