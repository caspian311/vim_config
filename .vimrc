let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 50

set cindent
set smartindent
set autoindent
let &scrolloff=999-&scrolloff
set tabstop=3
filetype on
set shiftwidth=3
set expandtab
set mouse=a

function! DevSetup()
	let g:in_dev_mode= exists('g:in_dev_mode') ? !g:in_dev_mode : 1
   if g:in_dev_mode
     set number
     set hlsearch

     NERDTree
     TlistToggle

     map <F4> :FufCoverageFile<CR>
     map <F5> :shell<CR>
   else
     set nonumber
     set nohlsearch

     NERDTreeClose
     TlistToggle

     unmap <F4>
     unmap <F5>
   endif

endfunction

map <F12> :call DevSetup()<CR>


