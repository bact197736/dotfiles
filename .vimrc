" my common settings
:set nocompatible
:set background=dark
:syntax on
:set number
:set tabstop=4
:set shiftwidth=4
:set incsearch
:set hidden
:filetype plugin on

" refer to :help filetype
:filetype on
" disable cindent when you want to use smartindent.
:set nocindent
:set smartindent
:filetype indent on
" refer to :help ftplugins
:filetype plugin on

" insert CTRL-V to avoid #b or #e is expanded.
":abbreviate #b /**********************************************************
":abbreviate #e <space>**********************************************************/


" my key mappings
:map <C-l> :bnext<CR>
:map <C-k> :bprevious<CR>

set expandtab                          " ����ʸ���������Ʊ�����ζ���ʸ���������
set tabstop=4                          " ����ʸ����ɽ����
set shiftwidth=4                       " ��>>��,��<<�����Υ��ե���
set autoindent                         " ENTER ���˼�ư�ǥ���ǥ��
set smartindent                        " ������ư����ǥ��

set list                               " ����ʸ��������ʸ����ɽ��
set listchars=tab:>-,trail:.,extends:> " list ɽ���λ���ʸ������

set incsearch                          " �������򥤥󥯥��󥿥륵�����ˤ���
set ignorecase                         " �������羮ʸ������̤��ʤ�
set smartcase                          " ����ʸ������ʸ�����ޤޤ�������ʸ����ʸ������̤���
set wrapscan                           " �����ǥե����뽪ü���褿����Ƭ�����
"set hlsearch                          " �������ʸ����Υϥ��饤��

set showmatch                          " ���ϻ����б������̤�ɽ��
"set wildmode=list                     " �䴰ư�������
set wildmenu                           " �䴰�����ɽ��
set backspace=indent,eol,start         " ��Ƭ(indent), ����(eol), �����⡼�ɤγ��ϰ���(start)�Ǥζ���κ�������
"set encoding=japan                    " vim ���̾���Ѥ���ʸ�����󥳡��ǥ���
set iminsert=0                         " ���ϥ⡼�ɤǤ�IME�Υǥե���Ⱦ���
set imsearch=0                         " �����⡼�ɤǤ�IME�Υǥե���Ⱦ���
set wrap                               " �������ޤ��֤�
set shortmess+=I                       " C-g ��ɽ�������ե��������Υե����ޥå�
set showcmd                            " ������Υ��ޥ�ɤ򥹥ơ�������ɽ��
set showmode                           " INSERT�ʤɤΥ��ơ�������ɽ������
set number                             " ���ֹ��ɽ��
set notitle                            " �����ȥ�С����Խ���Υե�����̾�ʤɤ�ɽ��
set ruler                              " ����������־����ɽ��
set noequalalways                      " ������ɥ���ʬ�䤷�����Ĥ����ꤷ�����˥ꥵ�������ʤ�
set nobackup                           " �Хå����åץե��������ʤ�
set shortmess+=I                       " ��ư���Υ�å�������ä�
set history=9999
"set cursorline                         " ��������饤��

au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

syntax on

" ���顼��������
colorscheme mycolor

let s:hostName = hostname()
let s:user = system("id -un")

" ����
"let s:hostName_s = substitute(system("hostname -s"), "\n$", "", "")
set tags=${HOME}/tmp/tags/cscope.out,${HOME}/tmp/tags/ctags.tag
" �ѥ�
set path=.\ ~/\ /home/y/share/pear

" ��¢��termcap�ե������Ȥ�
"if substitute(system("uname","\n$","","") ==? "freebsd"
"       set term=builtin_cons25
"elseif substitute(system("uname"), "\n$", "", "") ==? "linux"
"       set term=builtin_linux
"elseif has("unix")
"       set term=builtin_xterm
"endif

"if (substitute(s:user, "\n$", "", "") == $USER) && (s:hostName =~ '\(\w\+\.\(dev\|miniy\|podcast\.tnz\)\|mix4\.geo\.bbt\)')
"   set term=vt100
"else
"   set term=builtin_cons25
"endif

:set fileencodings=utf-8,euc-jp,iso-2022-jp,cp932
:set enc=utf-8


"-----------------------------------------------------------------------------
" �����ȥ��ޥ��
"
if has("autocmd")
    " �ץ饰���󡢥ե����륿�����̥���ǥ�Ȥ�ͭ��
    filetype plugin indent on
    " text�ե�����Υ�����78������
    "autocmd FileType text setlocal textwidth=78
    " ����������֤򵭲����Ƥ���
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

    "PHP����̎�����
    "autocmd FileType php set dictionary+=${HOME}/files/misc/dict/php.dict
    "set complete=.,w,k
endif " has("autocmd")


"-----------------------------------------------------------------------------
" Function���
"
" GetStatusEx
" ���ơ�����ɽ����function
"function! GetStatusEx()
"   let str = '['
"   if has('multi_byte') && &fileencoding != ''
"       let str = str . &fileencoding . ':'
"   endif
"   let str = str . &fileformat . ']'
"   return str
"endfunction

" C-h �ǥϥ��饤�Ȥ�Toggle
"nmap <C-H> :call ToggleHighlight()<CR>
"function! ToggleHighlight()
"   if &hlsearch != ''
"       set nohlsearch
"   else
"       set hlsearch
"   endif
"endfunction
nmap <C-H> :se hls!<CR>



"-----------------------------------------------------------------------------
"���ơ������饤���ɽ��������ܤλ���
"set statusline=%y%{GetStatusEx()}%F%m%r%=<%c:%l>
set laststatus=2
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%=                           " right align remainder
set statusline+=0x%-8B                       " character value
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position


"-----------------------------------------------------------------------------
" �ޥå����
map [[ ?{w99[{ 
map ][ /}b99]} 
map ]] j0[[%/{ 
map [] k$][%?}

" <F2>-<F4>�ϵ�ǽ����
"map <F2> <ESC>:bp<CR>
"map <F3> <ESC>:bn<CR>
"map <F4> <ESC>:bw<CR>
map <F5> <ESC>:bd<CR>
map <F6> :!grep  *<CR>
map <F7> :Tlist<CR>
"map <F9> :set term=builtin_cons25<CR>
"map <F10> <ESC>:set paste<CR>
"map <F11> <ESC>:set nopaste<CR>
"imap <F10> <C-O>:set paste<CR>
"imap <F11> <nop>
set pastetoggle=<F12>

" ɽ����ñ�̤ǹ԰�ư����褦�ˤ���
nnoremap j gj
nnoremap k gk
" [home][end]��ͭ����
nmap [1~ ^
nmap [4~ $
imap [1~ ^
imap [4~ $
"imap a a
"imap i i
"imap o o

" �����⡼�ɻ���CTRL-B/F�ǤΥڡ��������ͭ����
imap  
imap  

" ���������줬��������褦��
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz 
nmap g# g#zz

"-----------------------------------------------------------------------------
" ά���䴰
iabbrev y #ifdef YAHOO_JP
iabbrev l #else
iabbrev e #endif

iabbrev y //YJP  t.yamoto [] -
iabbrev t //t.yamoto [] -
iabbrev s /****************************************
iabbrev e <Space>****************************************/

"-----------------------------------------------------------------------------
" ������䴰
set completeopt=menu
"<C-g>��omni�䴰
imap <C-j> <C-x><C-o>

"-----------------------------------------------------------------------------
" ��ʬɽ������
set diffexpr=IgnoreSpaceDiff()
function IgnoreSpaceDiff()
    let opt = ""
    if &diffopt =~ "icase"
        let opt = opt . "-i "
    endif
    if &diffopt =~ "iwhite"
        let opt = opt . "-b "
    endif
    silent execute "!diff --ignore-all-space -a " . opt .
                \  v:fname_in . " " . v:fname_new .
                \  " > " . v:fname_out
endfunction


"-----------------------------------------------------------------------------
" ������ץ�����

"--- minibufexpl.vim ---
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1
"let g:miniBufExplMaxHeight = 1
"nmap <Space> :MBEbn<CR>
" GNU screen like�ʥ����Х����
let mapleader = ""
"nnoremap <Leader><Space> :MBEbn<CR>
"nnoremap <Leader>n       :MBEbn<CR>
"nnoremap <Leader><C-n>   :MBEbn<CR>
"nnoremap <Leader>p       :MBEbp<CR>
"nnoremap <Leader><C-p>   :MBEbp<CR>
"nnoremap [C            :bn<CR>
"nnoremap [D            :bp<CR>
"nnoremap <Leader><Space> :bn<CR>
"nnoremap <Leader><BS>    :bp<CR>
"nnoremap <Leader>n       :bn<CR>
"nnoremap <Leader>p       :bp<CR>
"nnoremap <Leader>c       :new<CR>
"nnoremap <Leader>k       :bd<CR>
"nnoremap <Leader><C-w>   :ls<CR>
"nnoremap <Leader>1   :e #1<CR>
"nnoremap <Leader>2   :e #2<CR>
"nnoremap <Leader>3   :e #3<CR>
"nnoremap <Leader>4   :e #4<CR>
"nnoremap <Leader>5   :e #5<CR>
"nnoremap <Leader>6   :e #6<CR>
"nnoremap <Leader>7   :e #7<CR>
"nnoremap <Leader>8   :e #8<CR>
"nnoremap <Leader>9   :e #9<CR>
"--- minibufexpl.vim ---
"nmap     bb :ls<CR>:buf 

"--- qbuf.vim ---
let g:qb_hotkey = "bb"

"--- mru.vim ---
"MRU�Υե�����ꥹ�Ȥ˵�Ͽ���Ƥ�������ե�������Ǥ���
let MRU_Max_Entries=30
"���������ɽ���˥ޥå�����ե�����̾�Υե������MRU�Υե�����ꥹ�Ȥ˵�Ͽ���ʤ��褦�ˤ��ޤ���
"�ǥե���ȤǤϡ����ƤΥե������Ͽ���ޤ���
let MRU_Exclude_Files="^/tmp/.*\|^/var/tmp/.*"
"MRU�Υե�����ꥹ�ȤΥ�����ɥ��ι⤵������Ǥ���
let MRU_Window_Height=8
"MRU�Υե�����ꥹ�Ȥ򳫤����ˡ������Υ�����ɥ���ɽ�����뤫�������ȤΥ�����ɥ���ɽ�����뤫������Ǥ���
"�ǥե���ȤǤϡ������Υ�����ɥ���ɽ�����ޤ���
let MRU_Use_Current_Window=0
"MRU�Υե�����ꥹ�Ȥ���ե������Enter���������򤷤����ˡ��ե�����ꥹ�ȤΥ�����ɥ����Ĥ��뤫�ɤ���������Ǥ���
"�ǥե���ȤǤϥե�����������˥�����ɥ����Ĥ��ޤ���
let MRU_Auto_Close=1


"--- yankring.vim ---
let g:yankring_max_history = 50


"--- omnicppcomplete.vim ---
"set nocp
"set completeopt=menu
"let OmniCpp_NamespaceSearch = 2
""<C-g>��omni�䴰
"imap <C-g> <C-x><C-o>


let php_folding=1
"au Syntax php set fdm=syntax

" �����Ƥ���ե������ʸ�������ɤ���ꤷ�Ƴ����ʤ���
" EUC-JP
nmap ,ee :e ++enc=euc-jp<CR>
" SJIS
nmap ,es :e ++enc=cp932<CR>
" JIS
nmap ,ej :e ++enc=iso-2022-jp<CR>
" UTF-8
nmap ,eu :e ++enc=utf-8<CR>
