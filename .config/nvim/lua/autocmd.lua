vim.cmd([[
  augroup rustfmt
    autocmd!
    autocmd BufWritePre *.rs :RustFmt 
  augroup end
]])
