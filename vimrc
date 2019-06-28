set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/rainbow_parentheses.vim'
Plugin 'ervandew/supertab'
Plugin 'csexton/trailertrash.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-haml'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'thoughtbot/vim-rspec'
Plugin 'ngmy/vim-rubocop'
Plugin 'vim-ruby/vim-ruby'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


set shell=/bin/zsh
set nocompatible
set expandtab
set smartindent
set number
set cursorline
set showmatch
set ruler
set hlsearch
set colorcolumn=80

syntax on
set background=dark
colorscheme solarized

nmap @ :NERDTree<Return>
let g:gitgutter_enabled = 1
let g:gitgutter_highlight_lines = 0
let g:gitgutter_signs =  1
highlight clear SignColumn
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

set list
set listchars=tab:▸\ ,trail:¬ ",eol:.
hi UnwantedTrailerTrash guibg=red ctermbg=red

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" nnoremap <silent> <Right> :bnext<CR>
" nnoremap <silent> <Left> :bprevious<CR>
" nnoremap <silent> <Up> <Nop>
" nnoremap <silent> <Down> <Nop>

" FDOC=1 FPROF=1 RD_PROF=1
let g:rspec_command = "!. ~/.rvm/scripts/rvm && FDOC=1 FPROF=1 RD_PROF=1 bundle exec foreman run rspec {spec}"

let g:vimrubocop_keymap = 0
nmap <Leader>r :RuboCop<CR>
nmap <Leader>cc :CodeClimateAnalyzeCurrentFile<CR>
" let g:vimrubocop_config = './rubocop.yml'

nmap <Leader>b :CtrlPBuffer<CR>

let g:fuzzy_ignore = "node_modules/***;.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"
" Ignore stuff for ctrl p
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip    "
"   MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" ctrlp missing files fix
let g:ctrlp_max_files=0

let g:airline_theme='luna'
let g:airline_powerline_fonts=1
set laststatus=2

set statusline+=%#warningmsg#
set statusline+=%*
au BufNewFile,BufRead Jenkinsfile setf groovy
