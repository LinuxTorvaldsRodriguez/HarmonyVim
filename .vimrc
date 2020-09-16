"
"+=====================================================================================+
"+                                                                                     +
"+      _    _                                         __      ___                     +
"+     | |  | |                                        \ \    / (_)                    +
"+     | |__| | __ _ _ __ _ __ ___   ___  _ __  _   _   \ \  / / _ _ __ ___            +
"+     |  __  |/ _` | *__| *_ ^ _  */ _ *| *_ *| | | |   \ \/ / | | *_ ^ _  *          +
"+     | |  | | (_| | |  | | | | | | (_) | | | | |_| |    \  /  | | | | | | |          +
"+     |_|  |_|\__,_|_|  |_| |_| |_|\___/|_| |_|\__, |     \/   |_|_| |_| |_|          +
"+                                              ___/ |                                 +
"+                                             |____/                                  +
"+                                                                                     +
"+                                  Just enjoy it!                                     +
"+                                author:coco-linux                                    +
"+                             email:2673483151@qq.com                                 +
"+                          Simple,  fast  and  efficient.                             +
"+            Direction determines the road, the road determines the fate.             +
"+    wellcome to my github ——https://github.com/LinuxTorvaldsRodriguez/HarmonyVim     +
"+=====================================================================================+


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","      		" 定义<leader>键
set nocompatible         		" 设置不兼容原始Vi模式
filetype on              		" 设置开启文件类型侦测
filetype indent on         	 	" 针对不同的文件采用不同的缩进方式
filetype plugin on       		" 设置加载对应文件类型的插件
filetype plugin indent on  	 	" 自动识别文件类型，用文件类型plugin脚本，使用缩进定义文件
set noeb                 		" 关闭错误的提示
syntax enable            		" 开启语法高亮功能
syntax on                		" 自动语法高亮
set t_Co=256             		" 开启256色支持
set cmdheight=2          		" 设置命令行的高度
set showcmd              		" select模式下显示选中的行数
set ruler                		" 总是显示光标位置
set laststatus=2         		" 总是显示状态栏(默认值为1,无法显示状态栏)
set number               		" 开启行号显示
set cursorline           		" 突出显示当前行(为光标所在行加下划线)
set whichwrap+=<,>,h,l   		" 设置光标键跨行
set ttimeoutlen=0        		" 设置<ESC>键响应时间
set virtualedit=block,onemore   " 允许光标出现在最后一个字符的后面
set helplang=cn         		" 添加中文支支持,使用中文的帮助文档
set smartindent         		" 智能对齐:即依据上面的对齐格式，智能的选择对起方式，对于类似C语言编程(开启新行时使用自动缩进)
set confirm             		" 在处理未保存或只读文件的时候，弹出确认框
set history=1000        		" 历史纪录行数
set errorbells              	" 开启错误时响铃
set guioptions=mrb          	" 打开水平滚动条，右侧垂直滚动条，菜单
set showmatch					" 显示匹配的括号





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进和排版
" 注意:
" 在写Makefile的时候用空格代替制表符是不行的
" 会出现如下错误:
" 	Makefile:xx行: *** 遗漏分隔符遗漏分隔符%s停止.
" 解决办法:
" 请参考帖子:
" https://blog.csdn.net/Jackiellx/article/details/51184486
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent           		" 设置自动缩进，即把当前行的对齐格式应用到下一行
set cindent              		" 设置使用C/C++语言的自动缩进方式
set cinoptions=g0,:0,N-s,(0    	" 设置C/C++语言的具体缩进方式
set smartindent         	 	" 智能的选择对其方式
if !(filereadable('Makefile') && filereadable('makefile'))
    set expandtab            	" 将制表符扩展为空格
endif
set tabstop=4            		" 设置编辑时制表符占用空格数
set shiftwidth=4         		" 设置格式化时制表符占用空格数
set softtabstop=4        		" 设置4个空格为制表符
set smarttab             		" 在行和段开始处使用制表符
set nowrap               		" 禁止折行
set backspace=2          		" 使用回车键正常处理indent,eol,start等
set sidescroll=10        		" 设置向右滚动字符数
set nofoldenable         		" 禁用折叠代码

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu             		" vim自身命名行模式智能补全
set completeopt-=preview 		" 补全时不显示窗口，只显示补全列表

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch            		" 高亮显示搜索结果
set incsearch           		" 开启实时搜索功能
set ignorecase          		" 搜索时大小写不敏感,即忽略大小写

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 缓存设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup            		" 设置不备份(禁止生成临时文件)
set noswapfile          		" 禁止生成临时文件
set autoread            		" 文件在vim之外修改过，自动重新读入
set autowrite           		" 设置自动保存
set confirm            		 	" 在处理未保存或只读文件的时候，弹出确认

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=zh_CN.UTF-8
set helplang=cn
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gvim/macOSvim设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
    let system = system('uname -s')
    if system == "Darwin\n"
        " 设置字体
        set guifont=Droid\ Sans\ Mono\ Nerd\ Font\ Complete:h18
    else
        " 设置字体
        set guifont=DroidSansMono\ Nerd\ Font\ Regular\ 18
    endif
    set guioptions-=m           " 隐藏菜单栏
    set guioptions-=T           " 隐藏工具栏
    set guioptions-=L           " 隐藏左侧滚动条
    set guioptions-=r           " 隐藏右侧滚动条
    set guioptions-=b           " 隐藏底部滚动条
    set showtabline=0           " 隐藏Tab栏
    set guicursor=n-v-c:ver5    " 设置光标为竖线
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 卸载默认插件UnPlug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:deregister(repo)
    let repo = substitute(a:repo, '[\/]\+$', '', '')
    let name = fnamemodify(repo, ':t:s?\.git$??')
    call remove(g:plugs, name)
endfunction
command! -nargs=1 -bar UnPlug call s:deregister(<args>)


"######################################################################
" 插件列表开始
"######################################################################
" 如果call plug#begin()的参数为空，则需要设置插件管理器的运行时路径和一些初始化配置。
" 配置如下(如果begin()参数已经指定运行时路径，则无需设置):
" set rtp+=~/.vim/plugged
call plug#begin('~/.vim/plugged')

Plug 'chxuan/cpp-mode'
Plug 'chxuan/vim-edit'
Plug 'chxuan/change-colorscheme'
Plug 'chxuan/prepare-code'
Plug 'chxuan/vim-buffer'
Plug 'LinuxTorvaldsRodriguez/vimplus-startify'
Plug 'chxuan/tagbar'
Plug 'Valloric/YouCompleteMe'
Plug 'Yggdroot/LeaderF'
Plug 'mileszs/ack.vim'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'majutsushi/tagbar'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'vim-scripts/txt.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'gorodinskiy/vim-coloresque'
Plug 'will133/vim-dirdiff'
Plug 'junegunn/vim-slash'
Plug 'junegunn/gv.vim'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function'
Plug 'sgur/vim-textobj-parameter'
Plug 'Shougo/echodoc.vim'
" Plug 'terryma/vim-multiple-cursors'
Plug 'terryma/vim-smooth-scroll'
Plug 'rhysd/clever-f.vim'
Plug 'vim-scripts/indentpython.vim'
Plug 'Yggdroot/indentLine'
Plug 'gorodinskiy/vim-coloresque'
" Plug 'terryma/vim-expand-region'
" 黑客代码雨
Plug 'vim-scripts/matrix.vim--Yang'
" 共享目录树插件
" 在你在终端打开vim时，自动打开目录树
" 直接在命令行输入vim时，左边是目录树，右边是欢迎界面
Plug 'jistr/vim-nerdtree-tabs'
" 自动索引目录插件
Plug 'ludovicchabant/vim-gutentags'
" 在光标移动到变量名或者函数名时，在变量或函数名底部加上下划线
Plug 'itchyny/vim-cursorword'
" 匹配不同层级括号的颜色
Plug 'kien/rainbow_parentheses.vim'
" 去掉行尾的空格
Plug 'bronson/vim-trailing-whitespace'
" C++语法高亮增强,支持11/14/17
Plug 'octol/vim-cpp-enhanced-highlight',{ 'for':['c','cpp'] }
" 代码注释插件
Plug 'scrooloose/nerdcommenter'
" Vim中文文档计划,Vim本身带有一个完备的帮助系统。
" 本项目的目的就是将Vim的这些文档翻译成中文，以便更多的人认识及更好地使用这个非常强大的编辑器。
" 文档分类用户手册和参考手册两部分，你既可以象使用教程那样循序渐进，也可以快速地查阅来获取帮助。
Plug 'yianwillis/vimcdoc'
" 异步执行插件
Plug 'skywind3000/asyncrun.vim'
"搜索栏预览,预览 quickfix 窗口
Plug 'skywind3000/vim-preview'
" 加载自定义插件
if filereadable(expand($HOME . '/.vimrc.custom.plugins'))
    source $HOME/.vimrc.custom.plugins
endif
call plug#end()
"######################################################################
" 插件列表结束
"######################################################################

" load Vim default plugin
runtime macros/matchit.vim

" 编辑vimrc相关配置文件
nnoremap <leader>e :edit $MYVIMRC<cr>
nnoremap <leader>vc :edit ~/.vimrc.custom.config<cr>
nnoremap <leader>vp :edit ~/.vimrc.custom.plugins<cr>

" 查看HarmonyVim的help文件
nnoremap <leader>h :view +let\ &l:modifiable=0 ~/.vimplus/help.md<cr>

" 打开当前光标所在单词的Vim帮助文档
nnoremap <leader>H :execute ":help " . expand("<cword>")<cr>

" 按CTRL+u显示/关闭行号
nnoremap <C-u> :set number! number?<CR>

" 重新加载vimrc文件
nnoremap <leader>s :source $MYVIMRC<cr>

" 安装、更新、删除插件
nnoremap <leader><leader>i :PlugInstall<cr>
nnoremap <leader><leader>u :PlugUpdate<cr>
nnoremap <leader><leader>c :PlugClean<cr>

" 分屏窗口移动
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" 映射全选+复制 Ctrl+a
map <C-A> ggVGy

" 在选中状态下按下组合键Ctrl+c复制
vmap <C-c> "+y

" 按CTRL+F键格式化代码
map <C-F> gg=G

" <Leader><Leader>q 退出当前窗口
nmap <Leader><Leader>q :wqall<cr>

" 按<Leader><Leader>vp键将光标所在的区域进行上下分屏
nmap <Leader><Leader>sp :sp<CR>

" 按<Leader><Leader>vsp键将光标所在的区域进行左右分屏
nmap <Leader><Leader>vsp :vsp<CR>

" 按下组合键<Leader>p来关闭当前分割窗口
nmap <Leader>q :q<CR>

" 复制当前选中到系统剪切板
vmap <leader><leader>y "+y

" 将系统剪切板内容粘贴到Vim
nnoremap <leader><leader>p "+p

" 打开文件自动定位到最后编辑的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

" 主题设置
set background=dark
let g:onedark_termcolors=256
colorscheme gruvbox


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
let g:airline_theme="base16_monokai"
"这个是安装字体后 必须设置此项"
let g:airline_powerline_fonts = 1
" 是否打开tabline
" 打开后，tabline和tmuxline都可以得到增强
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置cpp-mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
nnoremap <leader>y :CopyCode<cr>
nnoremap <leader>p :PasteCode<cr>
nnoremap <leader>i :GoToFunImpl<cr>
nnoremap <silent> <leader>a :Switch<cr>
nnoremap <leader><leader>fp :FormatFunParam<cr>
nnoremap <leader><leader>if :FormatIf<cr>
nnoremap <leader><leader>t dd :GenTryCatch<cr>
xnoremap <leader><leader>t d :GenTryCatch<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置change-colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
nnoremap <silent> <F1> :PreviousColorScheme<cr>
inoremap <silent> <F1> <esc> :PreviousColorScheme<cr>
nnoremap <silent> <F2> :NextColorScheme<cr>
inoremap <silent> <F2> <esc> :NextColorScheme<cr>
nnoremap <silent> <F3> :RandomColorScheme<cr>
inoremap <silent> <F3> <esc> :RandomColorScheme<cr>
nnoremap <silent> <F4> :ShowColorScheme<cr>
inoremap <silent> <F4> <esc> :ShowColorScheme<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置prepare-code
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
let g:prepare_code_plugin_path = expand($HOME . "/.vim/plugged/prepare-code")


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置vim-buffer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
nnoremap <silent> <c-p> :PreviousBuffer<cr>
nnoremap <silent> <c-n> :NextBuffer<cr>
nnoremap <silent> <leader>d :CloseBuffer<cr>
nnoremap <silent> <leader>D :BufOnly<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置vim-edit
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
nnoremap Y :CopyText<cr>
nnoremap D :DeleteText<cr>
nnoremap C :ChangeText<cr>
nnoremap <leader>r :ReplaceTo<space>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
nnoremap <silent> <leader>n :NERDTreeToggle<cr>
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let g:NERDTreeDirArrowExpandable='▷'
let g:NERDTreeDirArrowCollapsible='▼'
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
"显示书签列标
let NERDTreeShowBookmarks=1
"设置忽略显示如下文件类型
let NERDIreeIgnore=['\~$', '\.pyc$', '\.swp$']
"设置目录树窗口大小
let NERDTreeWinSize=24
"在终端启动vim时，共享NERDTree，即自动打开目录树
let g:nerdtree_tabs_open_on_console_startup=1
"在目录树窗口中显示隐藏文件
let NERDTreeShowHidden=1
"如果在打开一个文件时顺便打开目录树，可以添加一下这行
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置YCM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" 如果不指定Python解释器路径，YCM会自己搜索一个合适的(与编译YCM时使用的Python版本匹配)
" let g:ycm_server_python_interpreter = '/usr/bin/python3'
" let g:ycm_global_ycm_extra_conf='~/.HarmonyVim/.ycm_extra_conf.py'
" 在.HarmonyVim目录下执行:
" ln -s ${PWD}/.ycm_extra_conf.py /home/coco-linux/linux-kernel/linux-kernel-4.1.15/
" 会产生一个链接文件，如下:
" .ycm_extra_conf.py -> /home/coco-linux/.HarmonyVim/.ycm_extra_conf.py
let g:ycm_confirm_extra_conf = 0
" 0表示关闭诊断信息，1表示开启趁断信息。
" 如果我们不想用YCM的趁断提示，而想用ALE的静态语法趁断提示。
" 则应该将ycm_show_diagnostics_ui设置为0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 收集
let g:ycm_min_num_identifier_candidate_chars = 2  " 两个字符触发补全
let g:ycm_max_num_candidates = 35  " 候选数量
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '✹'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_goto_buffer_command = 'horizontal-split' " 跳转/查看函数定义时打开上下分屏
let g:ycm_semantic_triggers =  {
            \   'c' : ['->', '.','re![_a-zA-z0-9]'],
            \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
            \             're!\[.*\]\s'],
            \   'ocaml' : ['.', '#'],
            \   'cpp,objcpp' : ['->', '.', '::','re![_a-zA-Z0-9]'],
            \   'perl' : ['->'],
            \   'php' : ['->', '::'],
            \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
            \   'ruby' : ['.', '::'],
            \   'lua' : ['.', ':'],
            \   'erlang' : [':'],
            \ }
nnoremap <leader>u :YcmCompleter GoToDeclaration<cr>
nnoremap <leader>o :YcmCompleter GoToInclude<cr>
nnoremap <leader>ff :YcmCompleter FixIt<cr>
nmap <F5> :YcmDiags<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 检测到以下文件名后缀，自动打开tagbar
let g:tagbar_width = 27
autocmd BufReadPost *.cpp,*.c,*.h,*.cc,*.cxx call tagbar#autoopen()
nnoremap <silent> <leader>t :TagbarToggle<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置incsearch.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置vim-easymotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
let g:EasyMotion_smartcase = 1
map <leader>w <Plug>(easymotion-bd-w)
nmap <leader>w <Plug>(easymotion-overwin-w)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置nerdtree-git-plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
let g:NERDTreeGitStatusIndicatorMapCustom={
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ 'Ignored'   : '☒',
            \ "Unknown"   : "?"
            \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置LeaderF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
nnoremap <leader>f :LeaderfFile .<cr>
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg','.vscode','.wine','.deepinwine','.oh-my-zsh'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
            \}
let g:Lf_UseCache = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置ack
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
nnoremap <leader>F :Ack!<space>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置echodoc.vim
" 显示函数参数
" 使用以下命令创建包括语言和签名字段的标签文件。
" ctags -R --fields=+lS
" https://github.com/Shougo/echodoc.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" 新增加的配置
set cmdheight=2						" 设置命令行高度
highlight link EchoDocPopup Pmenu
" 原来的配置
let g:echodoc_enable_at_startup = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置tabular
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
nnoremap <leader>l :Tab /\|<cr>
nnoremap <leader>= :Tab /=<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置vim-smooth-scroll
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置gv
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
nnoremap <leader>g :GV<cr>
nnoremap <leader>G :GV!<cr>
nnoremap <leader>gg :GV?<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置 a.vim: .h -> .cpp or .cpp -> .h
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
nnoremap <silent> <leader>a :A<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置 cpp_class_scope_highlight
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
let c_no_curly_error = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置vim-preview
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"f预览,大F关闭
autocmd FileType qf nnoremap <silent><buffer>f :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer>F :PreviewClose<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 閰嶇疆nerdtree-git-status
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
let g:NERDTreeGitStatusPorcelainVersion=1

" 加载自定义配置
if filereadable(expand($HOME . '/.vimrc.custom.config'))
    source $HOME/.vimrc.custom.config
endif
