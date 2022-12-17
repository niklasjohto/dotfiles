require("telescope").setup {
	pickers = {
		find_files = {
			hidden = true
		},
    file_ignore_patterns = { "^node_modules/", "^.git/" }
	}
}
