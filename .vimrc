set cindent
set smartindent
set autoindent
let &scrolloff=999-&scrolloff
set tabstop=3
filetype on
set shiftwidth=3
set expandtab
set mouse=a
set hlsearch
set incsearch


syntax on
colorscheme vividchalk

set listchars=tab:>-,trail:·
set list

set number
let NERDTreeIgnore = ['\.pyc$']
map <F3> :FufRenewCache<CR>

map <F4> :FufCoverageFile<CR>
map <F5> :shell<CR>

function! DevSetup()
	let g:in_dev_mode= exists('g:in_dev_mode') ? !g:in_dev_mode : 1
   if g:in_dev_mode
     NERDTree
   else
     NERDTreeClose
   endif

endfunction

map <F12> :call DevSetup()<CR>

nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

