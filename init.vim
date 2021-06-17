set nocompatible
call plug#begin()
	Plug 'tpope/vim-surround'
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
	"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'turbio/bracey.vim' " live html :wq
	Plug 'dense-analysis/ale'
	" Use release branch (recommend)
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'airblade/vim-gitgutter' 
	Plug 'blueyed/vim-diminactive'
	"Plug 'junegunn/limelight.vim'
	"Plug 'junegunn/goyo.vim'
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors
set encoding=UTF-8
filetype plugin indent on
syntax on
syntax enable
set omnifunc=syntaxcomplete#Complete
"imap <c-space> <c-x><c-o>
"imap <c-space> <c-x><c-f>

set number relativenumber
set title
set fileformat=unix

colorscheme gruvbox
let g:AirlineTheme = 'gruvbox'
"let g:lightline = {'colorscheme': 'gruvbox', 'background': 'dark'}

" se elimina el font correspondiente al colorscheme
"highlight Normal ctermbg=none guibg=none
"highlight SignColumn ctermbg=none guibg=none
"highlight LineNr ctermbg=none guibg=none

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

"let g:deoplete#enable_at_startup = 1

inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

let g:ale_fixers = {
 \ 'html': ['prettier'],
 \ 'css': ['stylelint'],
 \}
let g:ale_linters = {
 \ 'html': ['htmlhint'],
 \ 'css': ['stylelint'],
 \}
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
let g:ale_disable_lsp = 1

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

"autocmd! VimEnter * Limelight
"autocmd! User GoyoEnter Limelight
"autocmd! User GoyoLeave Limelight 

autocmd VimEnter *.html Bracey 
" disable auto-formatting of comments entirely.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o 
