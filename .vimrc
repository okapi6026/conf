let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &compatible
  set nocompatible
endif

if isdirectory(expand('~/.vim/'))
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim.git' s:dein_repo_dir
  endif
endif

execute 'set runtimepath^=' . s:dein_repo_dir

call dein#begin(s:dein_dir)
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('jistr/vim-nerdtree-tabs')
call dein#add('nanotech/jellybeans.vim')
call dein#add('scrooloose/syntastic')
call dein#add('altercation/vim-colors-solarized')
call dein#add('w0ng/vim-hybrid')
call dein#add('vim-scripts/grep.vim')
call dein#add('simeji/winresizer')
call dein#add('scrooloose/nerdcommenter')
call dein#add('itchyny/lightline.vim')
call dein#add('vim-scripts/taglist.vim')
call dein#end()
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

"----------------------------------------------------------
"## 各種設定
"----------------------------------------------------------
"## setting
"文字コードをUFT-8に設定
set fenc=utf-8
"## バックアップファイルを作らない
set nobackup
"## スワップファイルを作らない
set noswapfile
"## 編集中のファイルが変更されたら自動で読み直す
set autoread
"## バッファが編集中でもその他のファイルを開けるように
set hidden
"## 入力中のコマンドをステータスに表示する
set showcmd
"## 行番号を表示
set number
"## 現在の行を強調表示←vimが重くなる・・
"set cursorline
"## 現在の行を強調表示（縦）←vimが重くなる・・
"set cursorcolumn
"## 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
"## インデントはスマートインデント
set smartindent
"## ビープ音を可視化
set visualbell
"## 括弧入力時の対応する括弧を表示
set showmatch
"## ステータスラインを常に表示
set laststatus=2
"## コマンドラインの補完
set wildmode=list:longest
"## 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
"インサートモードのEscをjjにすると便利らしい
inoremap <silent> jj <ESC>
"LeaderをSpaceキーにする
let mapleader = "\<Space>"
"esc連打でハイライト消す
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"----------------------------------------------------------
"## Tab系
"----------------------------------------------------------
"## 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:^_,trail:-,extends:>,precedes:<,nbsp:%
"## Tab文字を半角スペースにする
"set expandtab
"## 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
"## 行頭でのTab文字の表示幅
set shiftwidth=4

"----------------------------------------------------------
"## 検索系
"----------------------------------------------------------
"## 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
"## 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
"## 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
"## 検索時に最後まで行ったら最初に戻る
set wrapscan
"## 検索語をハイライト表示
set hlsearch
"## ESC連打でハイライト解除
"## ウィンドウの縦幅
"set lines=55
"## ウィンドウの横幅
"set columns=280

"----------------------------------------------------------
"## カラースキーム
"----------------------------------------------------------
syntax enable
colorscheme hybrid
set t_Co=256
set background=dark
"highlight clear
highlight Statement ctermfg		= 169
highlight Type ctermfg			= 169
highlight Operator ctermfg		= 142
highlight Define ctermfg		= 208
highlight PreProc ctermfg		= darkred
highlight SpecialKey ctermfg	= black
highlight String ctermfg		= darkcyan
highlight StorageClass ctermfg	= lightgreen
highlight Constant ctermfg		= darkcyan
highlight Comment ctermfg		= darkgray
highlight PreProc ctermfg		= darkgray
highlight Function ctermfg		= lightgray
highlight Identifier ctermfg	= lightgray
highlight Underlined ctermfg	= lightgray
highlight Ignore ctermfg		= lightgray
highlight Special ctermfg		= lightgray
highlight Normal ctermfg		= lightgray

"----------------------------------------------------------
"## ctags
"----------------------------------------------------------
" tagsジャンプの時に複数ある時は一覧表示                                        
nnoremap <C-]> g<C-]> 
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

"----------------------------------------------------------
"TagList.vimの設定
"----------------------------------------------------------
"一つのファイルの内容しか表示しない
let Tlist_Show_One_File = 1
"常に右側に表示
let Tlist_Use_Right_Window = 1
"タグリストウィンドウだけになったら閉じる
let Tlist_Exit_OnlyWindow = 1
"phpの場合は変数を表示しない（関数のみ）
let tlist_php_settings='php;f:function'
"ショートカット
map <silent> <leader>l :TlistToggle<CR>
"----------------------------------------------------------
"## NERDTreeToggle
"----------------------------------------------------------
nnoremap <silent><C-e> :NERDTreeTabsToggle<CR>
"let g:nerdtree_tabs_open_on_console_startup=1
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable  = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'

"----------------------------------------------------------
"## NERDCommenter
"----------------------------------------------------------
let g:NERDCreateDefaultMappings = 0
let NERDSpaceDelims = 1
nmap <Leader>/ <Plug>NERDCommenterToggle
vmap <Leader>/ <Plug>NERDCommenterToggle

"----------------------------------------------------------
"## winresizer
"----------------------------------------------------------
let g:winresizer_start_key = '<C-T>'

"----------------------------------------------------------
"## lightline
"----------------------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'dir', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }


"----------------------------------------------------------
" Syntasticの設定
"----------------------------------------------------------
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_highlighting = 1
" なんでか分からないけど php コマンドのオプションを上書かないと動かなかった
let g:syntastic_php_php_args = '-l'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*



"----------------------------------------------------------
" 矢印キーを無効
"----------------------------------------------------------
map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>


"----------------------------------------------------------
" vimが重いときのチェック用関数( "vim +'call ProfileCursorMove()' app/controllers/watch_controller.php")
"----------------------------------------------------------
function! ProfileCursorMove() abort
  let profile_file = expand('~/log/vim-profile.log')
  if filereadable(profile_file)
    call delete(profile_file)
  endif

  normal! gg
  normal! zR

  execute 'profile start ' . profile_file
  profile func *
  profile file *

  augroup ProfileCursorMove
    autocmd!
    autocmd CursorHold <buffer> profile pause | q
  augroup END

  for i in range(100)
    call feedkeys('j')
  endfor
endfunction

