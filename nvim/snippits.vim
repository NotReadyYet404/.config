"autocmd Filetype markdown map <leader>w yiWi[<esc>Ea](<esc>pa)
autocmd Filetype markdown inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap ,s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap ,d `` <++><Esc>F`i
autocmd Filetype markdown inoremap ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap ,h ====<Space><++><Esc>F=hi
autocmd Filetype markdown inoremap ,p ![](./pictures/<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,1 #<Space><Enter><++><Esc>kA<font color=#f5a37a></font><Esc>6hi
autocmd Filetype markdown inoremap ,2 ##<Space><Enter><++><Esc>kA<font color=#55aa7f></font><Esc>6hi
autocmd Filetype markdown inoremap ,3 ###<Space><Enter><++><Esc>kA<font color=#5000b8></font><Esc>6hi
autocmd Filetype markdown inoremap ,4 ####<Space><Enter><++><Esc>kA<font color=#ff1493></font><Esc>6hi
autocmd Filetype markdown inoremap ,l --------<Enter>
