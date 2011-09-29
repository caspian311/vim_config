let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 50

let &scrolloff=999-&scrolloff

function! DevSetup()
   set number
   filetype on
   set tabstop=3
   set shiftwidth=3
   set expandtab

   :set hlsearch



   NERDTree
   TlistToggle

   map <C-R> :FufCoverageFile<CR>
endfunction

map <F12> :call DevSetup()<CR>
