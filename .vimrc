set number
filetype on
set tabstop=3
set shiftwidth=3
set expandtab

let &scrolloff=999-&scrolloff

let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 50
autocmd VimEnter * NERDTree
autocmd VimEnter * TlistToggle

map <C-R> :FufCoverageFile<CR>


function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction
autocmd WinEnter * call NERDTreeQuit()
