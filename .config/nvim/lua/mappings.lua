local map = function(mode, key, action, opts)
  local option = { noremap = true, silent = true }
  if opts then
    option = vim.tbl_extend("force", option, opts)
  end
  vim.api.nvim_set_keymap(mode, key, action, option)
end

vim.g.mapleader = "<space>"

-- Built in mappings
map("n", "<CR>", ":noh<CR>")

-- Move lines with Alt + j/k
map("n", "<A-k>", ":m .-2<CR>")
map("i", "<A-k>", ":m .-2<CR>")
map("v", "<A-k>", ":m .-2<CR>")

map("n", "<A-j>", ":m .+<CR>")
map("i", "<A-j>", ":m .+<CR>")
map("v", "<A-j>", ":m .+<CR>")

-- Plugin mappings
map("n", "<C-j>", ":NvimTreeToggle<CR>")
map("n", "<C-k>", ":Telescope find_files<CR>")
map("n", "gd", "<Plug>(coc-definition)")
map("n", "gy", "<Plug>(coc-type-definition)")
map("i", "<CR>", "coc#pum#visible() ? coc#pum#confirm() : '<CR>'", { expr = true })
map("n", "<Tab>", ":lua Show_documentation() <CR>")

Show_documentation = function()
  local filetype = vim.bo.filetype
  if filetype == "vim" or filetype == "help" then
    vim.api.nvim_command("h " .. vim.fn.expand("<cword>"))
  else
    vim.fn.CocActionAsync("doHover")
  end
end
