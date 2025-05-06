local leet_arg = 'leetcode.nvim'

return {
	{
		'kawre/leetcode.nvim',
		lazy = leet_arg ~= vim.fn.argv()[1],
		build = ':TSUpdate html',
		dependencies = {
			'nvim-telescope/telescope.nvim',
			'nvim-lua/plenary.nvim', -- required by telescope
			'MunifTanjim/nui.nvim',
		},
		opts = {
			arg = leet_arg,
			lang = 'rust',
			-- directory = "/media/gus/proyectos/leetcode/",
			---@type boolean
			image_support = false,
			---@type lc.storage
			storage = {
				home = vim.fn.stdpath 'data' .. '/leetcode',
				cache = vim.fn.stdpath 'cache' .. '/leetcode',
			},
			---@type boolean
			logging = true,
			---@type table<string, boolean>
			plugins = {
				non_standalone = false,
			},

			console = {
				open_on_runcode = true, ---@type boolean

				dir = 'row', ---@type lc.direction

				size = { ---@type lc.size
					width = '90%',
					height = '75%',
				},

				result = {
					size = '60%', ---@type lc.size
				},

				testcase = {
					virt_text = true, ---@type boolean

					size = '40%', ---@type lc.size
				},
			},

			description = {
				position = 'left', ---@type lc.position
				width = '40%', ---@type lc.size
				show_stats = true, ---@type boolean
			},
			injector = {}, ---@type table<lc.lang, lc.inject>
			cache = {
				update_interval = 60 * 60 * 24 * 7, ---@type integer 7 days
			},
			keys = {
				toggle = { 'q' }, ---@type string|string[]
				confirm = { '<CR>' }, ---@type string|string[]

				reset_testcases = 'r', ---@type string
				use_testcase = 'U', ---@type string
				focus_testcases = 'H', ---@type string
				focus_result = 'L', ---@type string
			},
			-- hooks = {
			-- 	---@type fun(question: lc.ui.Question)[]
			-- 	['question_enter'] = {
			-- 		function()
			-- 			os.execute 'sleep 0.5'
			-- 			local file_extension = vim.fn.expand '%:e'
			-- 			if file_extension == 'rs' then
			-- 				local bash_script = tostring(vim.fn.stdpath 'data' .. '/leetcode/rust_init.sh')
			-- 				local success, error_message = os.execute(bash_script)
			-- 				if success then
			-- 					print 'Successfully updated rust-project.json'
			-- 					vim.cmd 'LspRestart rust_analyzer'
			-- 				else
			-- 					print('Failed update rust-project.json. Error: ' .. error_message)
			-- 					io.read()
			-- 				end
			-- 			end
			-- 		end,
			-- 	},
			--
			-- 	-- ---@type fun()[]
			-- 	-- ["leave"] = {},
			-- },
		},
	},
}
