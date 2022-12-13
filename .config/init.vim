:set number
:set showmatch
:set clipboard=unnamedplus
:set autoindent
:set tabstop=2
:set shiftwidth=2
:set ttyfast 
:set incsearch 
:set ignorecase
:syntax on

call plug#begin()
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'matze/vim-move'	
	Plug 'nvim-lualine/lualine.nvim'
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'EdenEast/nightfox.nvim'
	Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
	Plug 'sainnhe/everforest'
	Plug 'nvim-tree/nvim-tree.lua'
	Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'ggandor/leap.nvim'
call plug#end()

nnoremap <silent> <CR> :noh<CR>
nnoremap <silent> <C-j> :NvimTreeToggle<CR>
nnoremap <silent> <C-k> :Telescope find_files<CR>
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> <Tab> :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let g:prettier#config#use_tabs = 'false'
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

if has('termguicolors')
	set termguicolors
endif
let g:everforest_background = 'hard'

lua << EOF
require('lualine').setup {
	options = {
		theme = 'everforest'
	}
}

require('nvim-tree').setup {
	disable_netrw = true,
	open_on_setup = true,
	filters = { custom = { "^.git$" } },
}

require('telescope').setup {
	pickers = {
		find_files = {
			hidden = true
		}
	}
}

require('leap').add_default_mappings()
EOF

colorscheme everforest

