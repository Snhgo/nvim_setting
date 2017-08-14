inoremap <silent> <C-q> <ESC>
nnoremap <silent> <C-e> :NERDTreeTabsToggle<CR>
" インサートモード時の移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" タブ移動
nnoremap <C-n> gt
nnoremap <C-p> gT

" ノーマルモード時だけ ; と : を入れ替える
nnoremap ; :
nnoremap : ; 

" 新しいタブでターミナルを起動
nnoremap <C-t> :tabe<CR>:terminal<CR>
" Ctrl + q でターミナルを終了
tnoremap <C-q> <C-\><C-n>:q<CR>
" ESCでターミナルモードからノーマルモードへ
tnoremap <ESC> <C-\><C-n>
" ターミナルモードでのタブ移動
tnoremap <C-l> <C-\><C-n>gt
tnoremap <C-h> <C-\><C-n>gT

" 改行挿入
nnoremap 0 :<C-u>call append(expand('.'), '')<Cr>j

" 行の最初の文字の前にコメント文字をトグル
nnoremap <Leader>c <Plug>(caw:hatpos:toggle)
vnoremap <Leader>c <Plug>(caw:hatpos:toggle)
" 行頭にコメントをトグル
nnoremap <Leader>, <Plug>(caw:zeropos:toggle)
vnoremap <Leader>, <Plug>(caw:zeropos:toggle)
