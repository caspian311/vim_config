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
colorscheme vividchaulk

set listchars=tab:>-,trail:·
set list

function! DevSetup()
	let g:in_dev_mode= exists('g:in_dev_mode') ? !g:in_dev_mode : 1
   if g:in_dev_mode
     set number

     NERDTree

     map <F4> :FufCoverageFile<CR>
     map <F5> :shell<CR>
   else
     set nonumber

     NERDTreeClose

     unmap <F4>
     unmap <F5>
   endif

endfunction

map <F12> :call DevSetup()<CR>

nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

