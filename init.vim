" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

Plug 'vim-airline/vim-airline' 
Plug 'syntastic'
Plug 'ctrlpvim/ctrlp.vim', {'on': ['CtrlP', 'CtrlPMixed', 'CtrlPMRU']}
Plug 'mileszs/ack.vim'
Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-unimpaired'
Plug 'kien/ctrlp.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'mhinz/vim-startify'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
" Using a non-master branch
Plug 'rdnetto/YCM-Generator'
Plug 'EasyMotion'
Plug 'nathanaelkane/vim-indent-guides'
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()

inoremap jj <ESC>

nnoremap <silent> <Space>f :CtrlP<CR>
nnoremap <silent> <Space>m :CtrlPMixed<CR>
nnoremap <silent> <Space>r :CtrlPMRU<CR>

colorscheme gruvbox 
set background=dark

nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>
set relativenumber
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?
set cursorline        " highlight current line
set cursorcolumn " highlight current column

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

set autoindent
" when indenting with '>', use 4 spaces width
set shiftwidth=4
set tabstop=4
set softtabstop=4
" On pressing tab, insert 4 spaces
set noexpandtab
let g:startify_session_persistence=1
