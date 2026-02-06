return {
	{
		"wgurecky/vimSum",
		build = ":UpdateRemotePlugins",
		cmd = { "VisSum", "VisMean", "VisMult", "VisMath" },
		config = function()
			vim.keymap.set("x", "<C-s>", ":VisSum<CR>")
		end,
	},
}
