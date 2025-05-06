return {
	"folke/snacks.nvim",
  event = "VeryLazy",
	keys = {
		{ "<leader>.", function() Snacks.scratch() end,        desc = "Toggle Scratch Buffer" },
		{ "<leader>S", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
	}
}
