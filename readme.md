## HomeBrew简介

	这是一个基于Vim实现的开源轻量级配置框架的自动配置程序的远程存储库。
	我将基于此框架实现的Vim称为。在网络环境良好情况下，只需30分钟左右即可把环境配置好。
	真正做到了一键配置，不需要用户操心。会安装一些必备软件，比如说python、cmake、gcc、fontconfig等。
	也考虑到了有些系统的Vim(版本比较旧)不支持Python的新特性，它会自动去GitHub上下载Vim源码并将Python的相关支持编译进去。
	也会安装nerd-font字体来避免Vim显示出现乱码。不仅实现了YCM自动编译安装，给折腾了N天YCM都没有安装好的用户带来了希望，
	而且也支持macOS和linux众多发行版本，让Linux爱好者频繁切换发行版而不用操心Vim环境配置。

## HomeBrew的新特性
	以下仅列举主要的新特性，还有很多新特性需要您自己去摸索。O(∩_∩)O哈哈~
	1.实现了一键编译C/C++源代码;
	2.实现了一键调用GDB进行项目调试;
	3.实现了代码快速注释;
	4.实现了高亮匹配不同的括号;
	5.实现了一键格式化代码(这个功能真的很棒!);
	6.实现了基于cscope的全工程快速跳转(函数查找，查看被那些调用等);
	7.实现了在编辑Linux kernel源码之前自动配置功能，它实现了YCM准确补全Linux内核源码的数据结构;
	8.新建文件时，可以添加相应的头部注释信息;
	9.在查看函数的定义时在当前屏幕的上方裂开一个小窗口进行查看;

## 注意事项
	本项目旨在打造一款智能的Linux kernel编辑器而诞生。
	如果你想将VimKylin用于普通的工程，那么你可以根据需要修改.ycm_extra_conf.py文件。


## 安装

### MacOS X

#### 安装HomeBrew

    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#### 安装

    git clone https://github.com/TorvaldsRodriguez/VimKylin.git ~/.VimKylin
    或者
    git clone https://gitee.com/coco-linux/VimKylin.git ~/.VimKylin
    cd ~/.
    ./install.sh

#### 设置字体

	为防止显示乱码，需设置macOS终端字体为`Droid Sans Mono Nerd Font`。

#### 更新

	紧跟的步伐，尝试新版本带来的新特性
    ./update.sh

### Linux 64-bit

#### 支持以下发行版

<table>
<tr>
<td><a href="https://distrowatch.com/table.php?distribution=ubuntu"><img src="https://distrowatch.com/images/yvzhuwbpy/ubuntu.png"/></a><p align="center"></p></td>
<td><a href="https://distrowatch.com/table.php?distribution=ubuntukylin"><img src="https://distrowatch.com/images/yvzhuwbpy/ubuntukylin.png"/></a><p align="center"></p></td>
<td><a href="https://distrowatch.com/table.php?distribution=debian"><img src="https://distrowatch.com/images/yvzhuwbpy/debian.png"/></a><p align="center"></p></td>
<td><a href="https://distrowatch.com/table.php?distribution=kali"><img src="https://distrowatch.com/images/yvzhuwbpy/kali.png"/></a><p align="center"></p></td>
<td><a href="https://distrowatch.com/table.php?distribution=deepin"><img src="https://distrowatch.com/images/yvzhuwbpy/deepin.png"/></a><p align="center"></p></td>
<td><a href="https://distrowatch.com/table.php?distribution=mint"><img src="https://distrowatch.com/images/yvzhuwbpy/mint.png"/></a><p align="center"></p></td>
<td><a href="https://distrowatch.com/table.php?distribution=elementary"><img src="https://distrowatch.com/images/yvzhuwbpy/elementary.png"/></a><p align="center"></p></td>
<td><a href="https://distrowatch.com/table.php?distribution=centos"><img src="https://distrowatch.com/images/yvzhuwbpy/centos.png"/></a><p align="center"></p></td>
<td><a href="https://distrowatch.com/table.php?distribution=fedora"><img src="https://distrowatch.com/images/yvzhuwbpy/fedora.png"/></a><p align="center"></p></td>
<td><a href="https://distrowatch.com/table.php?distribution=arch"><img src="https://distrowatch.com/images/yvzhuwbpy/arch.png"/></a><p align="center"></p></td>
</tr>
<tr>
<td><a href="https://distrowatch.com/table.php?distribution=manjaro"><img src="https://distrowatch.com/images/yvzhuwbpy/manjaro.png"/></a><p align="center"></p></td>
<td><a href="https://distrowatch.com/table.php?distribution=opensuse"><img src="https://distrowatch.com/images/yvzhuwbpy/opensuse.png"/></a><p align="center"></p></td>
<td><a href="https://distrowatch.com/table.php?distribution=gentoo"><img src="https://distrowatch.com/images/yvzhuwbpy/gentoo.png"/></a><p align="center"></p></td>
</tr>
</table>


#### 安装

    git clone https://github.com/TorvaldsRodriguez/VimKylin.git ~/.VimKylin
    或者
    git clone https://gitee.com/coco-linux/VimKylin.git ~/.VimKylin
    cd ~/.
    ./install.sh //不要加sudo

#### 设置字体

	为防止显示乱码，需设置linux终端字体为`Droid Sans Mono Nerd Font`。

#### 多用户支持

	将在某个用户下安装好后，若需要在其他用户也能够使用，则执行如下命令:
	//username1 username2应替换为真实的用户名
    sudo ./install_to_user.sh username1 username2

#### 更新

	紧跟的步伐，尝试新版本带来的新特性
    ./update.sh

### Android 64-bit Termux

#### 安装

    git clone https://github.com/TorvaldsRodriguez/VimKylin.git ~/.VimKylin
    或者
    git clone https://gitee.com/coco-linux/VimKylin.git ~/.VimKylin
    cd ~/.
    ./install.sh

#### 更新

	紧跟的步伐，尝试新版本带来的新特性
    ./update.sh

## 自定义
	待安装完之后，在当前用户目录下存在以下几个配置文件：
	~/.vimrc：该配置文件是的默认配置，一般无需修改；
	~/.vimrc.custom.plugins：该配置文件是用户自定义的插件存放的位置，用户增加、卸载(注释掉Plug包含的插件地址信息，再在低行模式下执行:PlugClear即可)插件请修改该文件；
	~/.vimrc.custom.config: 该配置文件是存放用户自定义的配置文件，一般性配置应放入该文件中；


## 部分插件列表及说明

| 	      			插件         		| 	       						说明        								|
|---------------------------------------|---------------------------------------------------------------------------|
| [cpp-mode]                        	| 提供生成函数实现、函数声明/实现跳转、.h .cpp切换等功能。                  |
| [vim-edit]                      	    | 方便的文本编辑插件。                                                      |
| [change-colorscheme]            	    | 随心所欲切换主题 。                                                    	|
| [prepare-code]                	    | 新建文件时，生成预定义代码片段。                                          |
| [vim-buffer]                    	    | Vim缓存操作。                                             	            |
| [HarmonyVim-startify]                 | 欢迎界面(修改自mhinz/vim-startify)                            			|
| [tagbar]                        	    | 使用majutsushi/tagbar的V2.3版本，taglist的替代品，显示类、方法和变量等 	|
| [vim-plug]                       	    | 比Vundle下载更快的插件管理软件                                            |
| [YouCompleteMe]                  	    | 史上最强大的基于语义的自动补全插件，支持C/C++、C#、Python、PHP等语言      |
| [NerdTree]                       	    | 代码资源管理器                                                            |
| [vim-devicons]                  	    | 显示文件类型图标                                                          |
| [Airline]                        	    | 可以取代powerline的状态栏美化插件                                         |
| [auto-pairs]                    	    | 自动补全引号、圆括号、花括号等                                            |
| [LeaderF]                       	    | 比ctrlp更强大的文件的模糊搜索工具                                         |
| [ack]                           	    | 强大的文本搜索工具                                                        |
| [vim-surround]                  	    | 自动增加、替换配对符的插件                                                |
| [vim-commentary]                	    | 快速注释代码插件                                                          |
| [vim-repeat]                    	    | 重复上一次操作                                                            |
| [vim-endwise]                   	    | if/end/endif/endfunction补全                                              |
| [tabular]                       	    | 代码、注释、表格对齐                                                      |
| [vim-easymotion]                	    | 强大的光标快速移动工具，强大到颠覆你的插件观                              |
| [incsearch.vim]                 	    | 模糊字符搜索插件                                                          |
| [vim-fugitive]                 	    | 集成Git                                                                  	|
| [gv]                            	    | 显示git提交记录                                                           |
| [vim-slash]                     	    | 优化搜索，移动光标后清除高亮                                              |
| [echodoc]                       	    | 补全函数时在命令栏显示函数签名                                            |
| [vim-smooth-scroll]             	    | 让翻页更顺畅                                                       	 	|
| [clever-f.vim]                  	    | 强化f和F键                                                             	|
| [nerdtree-git-plugin]           	    | NerdTree显示git状态                                                       |
| [vim-nerdtree-syntax-highlight] 	    | NerdTree文件类型高亮                                                      |



## 的快捷键

以下是部分快捷键，可通过的`,h`命令查看的帮助文档。

| 	      		  快捷键         		| 	       							说明        						    |
|---------------------------------------|---------------------------------------------------------------------------|
| `,`                 					| Leader Key                                								|
| `<leader>n`         					| 打开/关闭代码资源管理器                   								|
| `<leader>t`         					| 打开/关闭函数列表                         								|
| `<leader>a`         					| .h .cpp 文件切换                          								|
| `<leader>u`         					| 转到函数声明                              								|
| `<leader>U`         					| 转到函数实现                              								|
| `<leader>u`         					| 转到变量声明                              								|
| `<leader>o`         					| 打开include文件                           								|
| `<leader>y`         					| 拷贝函数声明                              								|
| `<leader>p`         					| 生成函数实现                              								|
| `<leader>w`         					| 单词跳转                                  								|
| `<leader>f`         					| 搜索~目录下的文件                         								|
| `<leader>F`         					| 搜索当前目录下的文本                      								|
| `<leader>g`         					| 显示git仓库提交记录                       								|
| `<leader>G`         					| 显示当前文件提交记录                      								|
| `<leader>gg`        					| 显示当前文件在某个commit下的完整内容      								|
| `<leader>ff`        					| 语法错误自动修复(FixIt)                   								|
| `<c-p>`             					| 切换到上一个buffer                        								|
| `<c-n>`             					| 切换到下一个buffer                        								|
| `<leader>d`         					| 删除当前buffer                            								|
| `<leader>D`         					| 删除当前buffer外的所有buffer              								|
| `vim`               					| 运行Vim编辑器时,默认启动开始页面          								|
| `<F5>`              					| 显示语法错误提示窗口                      								|
| `<F9>`              					| 显示上一主题                              								|
| `<F10>`             					| 显示下一主题                              								|
| `<leader>l`         					| 按竖线对齐                                								|
| `<leader>=`         					| 按等号对齐                                								|
| `Ya`                					| 复制行文本到字母a                         								|
| `Da`                					| 剪切行文本到字母a                         								|
| `Ca`                					| 改写行文本到字母a                         								|
| `rr`                					| 替换文本                                  								|
| `<leader>r`         					| 全局替换，目前只支持单个文件              								|
| `rev`               					| 翻转当前光标下的单词或使用V模式选择的文本 								|
| `gcc`               					| 注释代码                                  								|
| `gcap`              					| 注释段落                                  								|
| `vif`               					| 选中函数内容                              								|
| `dif`               					| 删除函数内容                              								|
| `cif`               					| 改写函数内容                              								|
| `vaf`               					| 选中函数内容（包括函数名 花括号）         								|
| `daf`               					| 删除函数内容（包括函数名 花括号）         								|
| `caf`               					| 改写函数内容（包括函数名 花括号）         								|
| `fa`                					| 查找字母a，然后再按f键查找下一个          								|
| `<leader>e`         					| 快速编辑~/.vimrc文件                      								|
| `<leader>s`         					| 重新加载~/.vimrc文件                      								|
| `<leader>vp`        					| 快速编辑~/.vimrc.custom.plugins文件       								|
| `<leader>vc`        					| 快速编辑~/.vimrc.custom.config文件        								|
| `<leader>h`         					| 打开帮助文档                       										|
| `<leader>H`         					| 打开当前光标所在单词的Vim帮助文档         								|
| `<leader><leader>t` 					| 生成try-catch代码块                       								|
| `<leader><leader>y` 					| 复制当前选中到系统剪切板                  								|
| `<leader><leader>i` 					| 安装插件                                  								|
| `<leader><leader>u` 					| 更新插件                                  								|
| `<leader><leader>c` 					| 删除插件                                  								|


## 常见问题汇总

### 安装后Airline等插件有乱码，怎么解决？

Linux和mac系统需设置终端字体为Droid Sans Mono Nerd Font。

### Xshell连接远程主机不能使用vim-devicons或乱码。

Windows系统安装Nerd Font字体后并更改xshell字体即可。

### 安装会经常失败，安装了几次都不成功！！！

安装时需要访问外国网站，由于网络原因，可能会失败，安装成功也要1个多小时，ycm插件有200M左右，下载比较耗时，这里有下载好的YouCompleteMe.tar.gz文件，下载后解压到~/.vim/plugged/目录，并进入YouCompleteMe目录执行./install.py --clang-completer即可安装。

### 使用第三方库时怎么让YCM补全第三方库API？

安装完毕之后，~目录下将会生成两个隐藏文件分别是.vimrc和.ycm_extra_conf.py，其中.vimrc是vim的配置文件，.ycm_extra_conf.py是ycm插件的配置文件，当你需要创建一个project时，需要将.ycm_extra_conf.py拷贝到project的顶层目录，通过修改该配置文件里面的flags变量来添加你的第三方库路径。

### 安装完成后YCM不能够工作！！！

这里的原因可能就有很多了，可能每个人遇到的问题不一样，但KylinVim尽最大努力不让用户操心，需要注意的是ycm插件只支持64位的系统，更多信息请访问YCM官网。

### 在aaa用户下安装了，在bbb用户下不能使用？

目前KylinVim是基于用户的，如果你想在其他用户下也能使用KylinVim，也需要单独安装。

### 在Archlinux环境下不能使用YCM怎么办？(缺少libtinfo.so.5)

在Archlinux下可以试着使用pkgfile命令搜索依赖的文件具体在什么包内，目前找到的包含libtinfo.so.5的包是ncurses5-compat-libs(AUR)或者32位的lib32-ncurses5-compat-libs(AUR)，安装后即可正常使用。

### 以上没有我遇到的问题怎么办？

您可以通过上网找解决方法，或提Issues，也可以通过发邮件方式2673483151@qq.com一起讨论解决方法。期待大家发现问题，并把解决方法贴出来。O(∩_∩)O哈哈~

