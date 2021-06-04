set nocompatible
call plug#begin()
	" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
	Plug 'junegunn/vim-easy-align'

	" On-demand loading
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

	" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
	Plug 'fatih/vim-go', { 'tag': '*' }

	" Plugin options
	"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

	" Plugin outside ~/.vim/plugged with post-update hook
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'

	" Utilidad para diseño web
	Plug 'mattn/emmet-vim'

	" Tema para nvim
	Plug 'dracula/vim'
	Plug 'morhetz/gruvbox'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'itchyny/lightline.vim'

	" Better Visual Guide
	Plug 'Yggdroot/indentLine'

	Plug 'scrooloose/nerdtree'
	Plug 'ryanoasis/vim-devicons'

	Plug 'majutsushi/tagbar'
	Plug 'scrooloose/nerdcommenter'

	"Plug 'ervandew/supertab'
	Plug 'jiangmiao/auto-pairs'
	Plug 'alvan/vim-closetag'

	Plug 'sheerun/vim-polyglot'
	Plug 'KabbAmine/vCoolor.vim'
	Plug 'vim-scripts/loremipsum'
	Plug 'norcalli/nvim-colorizer.lua'
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors
set encoding=UTF-8
filetype plugin indent on
syntax on
syntax enable
set omnifunc=syntaxcomplete#Complete
"imap <c-space> <c-x><c-o>
imap <c-space> <c-x><c-f>

set number relativenumber
set title
set fileformat=unix

colorscheme gruvbox
let g:AirlineTheme = 'gruvbox'
let g:lightline = {'colorscheme': 'gruvbox', 'background': 'dark'}

highlight Normal ctermbg=none guibg=none
highlight SignColumn ctermbg=none guibg=none
highlight LineNr ctermbg=none guibg=none

" Config tecla de emmet
let g:user_emmet_leader_key=','

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" comando para nerdcommanter\
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv
"Toggle
nnoremap <silent> <f7> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

lua require'colorizer'.setup()

let g:deoplete#enable_at_startup = 1

inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
