set number
set noswapfile

"let mapleader = "\<Space>"

" Nerd_Commenter の基本設定
let g:NERDCreateDefaultMappings = 0
let NERDSpaceDelims = 1

filetype indent on
set tabstop=2
set shiftwidth=2
set expandtab

" 起動時にNERDTreeTabsを
let g:nerdtree_tabs_open_on_console_startup=1

" python3
let g:python3_host_prog = $PYENV_ROOT.'/shims/python3'

" プラグインがインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイルを用意しておく
  let g:rc_dir    = expand("~/.config/nvim")
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" Apple Scriptによる英数切り替え処理
if executable('osascript')
  let s:keycode_jis_eisuu = 102
  let g:force_alphanumeric_input_command = "osascript -e 'tell application \"System Events\" to key code " . s:keycode_jis_eisuu . "' &"

  inoremap <silent> <Esc> <Esc>:call system(g:force_alphanumeric_input_command)<CR>

  autocmd! FocusGained *
    \ call system(g:force_alphanumeric_input_command)
endif 

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

runtime! keymap.rc.vim
