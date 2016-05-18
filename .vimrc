set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'tmhedberg/matchit'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-vividchalk'
Plugin 'thoughtbot/vim-rspec'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set nocompatible

let mapleader=","

set cindent
set smartindent
set autoindent
set tabstop=2
set shiftwidth=3
set expandtab
set smarttab
set mouse=a
set hlsearch
set incsearch
set number
set numberwidth=4
set splitright
set backspace=indent,eol,start
set noswapfile

" set visual bell to nothing
set vb
set t_vb=

filetype on
syntax on
colorscheme vividchalk

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

map <Leader>n :NERDTreeToggle<CR>
nmap <silent> <BS> :nohlsearch<CR>

if has("gui_macvim")
  let g:rspec_runner = "os_x_iterm"
  let g:rspec_command = "bundle exec rspec {spec}"
endif

