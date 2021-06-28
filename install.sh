#!/bin/bash

# 获取linux发行版名称
function get_linux_distro()
{
    if grep -Eq "Ubuntu" /etc/*-release; then
        echo "Ubuntu"
    elif grep -Eq "Deepin" /etc/*-release; then
        echo "Deepin"
    elif grep -Eq "uos" /etc/*-release; then
        echo "UOS"
    elif grep -Eq "LinuxMint" /etc/*-release; then
        echo "LinuxMint"
    elif grep -Eq "elementary" /etc/*-release; then
        echo "elementaryOS"
    elif grep -Eq "Debian" /etc/*-release; then
        echo "Debian"
    elif grep -Eq "Kali" /etc/*-release; then
        echo "Kali"
    elif grep -Eq "CentOS" /etc/*-release; then
        echo "CentOS"
    elif grep -Eq "fedora" /etc/*-release; then
        echo "fedora"
    elif grep -Eq "openSUSE" /etc/*-release; then
        echo "openSUSE"
    elif grep -Eq "Arch Linux" /etc/*-release; then
        echo "ArchLinux"
    elif grep -Eq "ManjaroLinux" /etc/*-release; then
        echo "ManjaroLinux"
    elif grep -Eq "Gentoo" /etc/*-release; then
        echo "Gentoo"
    else
        echo "Unknow"
    fi
}

# 获取日期
function get_datetime()
{
    time=$(date "+%Y%m%d%H%M%S")
    echo $time
}

# 判断文件是否存在
function is_exist_file()
{
    filename=$1
    if [ -f $filename ]; then
        echo 1
    else
        echo 0
    fi
}

# 判断目录是否存在
function is_exist_dir()
{
    dir=$1
    if [ -d $dir ]; then
        echo 1
    else
        echo 0
    fi
}

#备份原有的.vimrc文件
function backup_vimrc_file()
{
    old_vimrc=$HOME"/.vimrc"
    is_exist=$(is_exist_file $old_vimrc)
    if [ $is_exist == 1 ]; then
        time=$(get_datetime)
        backup_vimrc=$old_vimrc"_bak_"$time
        read -p "Find "$old_vimrc" already exists,backup "$old_vimrc" to "$backup_vimrc"? [Y/N] " ch
        if [[ $ch == "Y" ]] || [[ $ch == "y" ]]; then
            cp $old_vimrc $backup_vimrc
        fi
    fi
}

#备份原有的.vimrc.custom.plugins文件
function backup_vimrc_custom_plugins_file()
{
    old_vimrc_plugins=$HOME"/.vimrc.custom.plugins"
    is_exist=$(is_exist_file $old_vimrc_plugins)
    if [ $is_exist == 1 ]; then
        time=$(get_datetime)
        backup_vimrc_plugins=$old_vimrc_plugins"_bak_"$time
        read -p "Find "$old_vimrc_plugins" already exists,backup "$old_vimrc_plugins" to "$backup_vimrc_plugins"? [Y/N] " ch
        if [[ $ch == "Y" ]] || [[ $ch == "y" ]]; then
            cp $old_vimrc_plugins $backup_vimrc_plugins
        fi
    fi
}

#备份原有的.vimrc.custom.config文件
function backup_vimrc_custom_config_file()
{
    old_vimrc_config=$HOME"/.vimrc.custom.config"
    is_exist=$(is_exist_file $old_vimrc_config)
    if [ $is_exist == 1 ]; then
        time=$(get_datetime)
        backup_vimrc_config=$old_vimrc_config"_bak_"$time
        read -p "Find "$old_vimrc_config" already exists,backup "$old_vimrc_config" to "$backup_vimrc_config"? [Y/N] " ch
        if [[ $ch == "Y" ]] || [[ $ch == "y" ]]; then
            cp $old_vimrc_config $backup_vimrc_config
        fi
    fi
}

#备份原有的.vim目录
function backup_vim_dir()
{
    old_vim=$HOME"/.vim"
    is_exist=$(is_exist_dir $old_vim)
    if [ $is_exist == 1 ]; then
        time=$(get_datetime)
        backup_vim=$old_vim"_bak_"$time
        read -p "Find "$old_vim" already exists,backup "$old_vim" to "$backup_vim"? [Y/N] " ch
        if [[ $ch == "Y" ]] || [[ $ch == "y" ]]; then
            cp -R $old_vim $backup_vim
        fi
    fi
}

# 备份原有的.vimrc和.vim
function backup_vimrc_and_vim()
{
    backup_vimrc_file
    backup_vimrc_custom_plugins_file
    backup_vimrc_custom_config_file
    backup_vim_dir
}

# 获取ubuntu版本
function get_ubuntu_version()
{
    line=$(cat /etc/lsb-release | grep "DISTRIB_RELEASE")
    arr=(${line//=/ })
    version=(${arr[1]//./ })
    echo ${version[0]}
}

# 获取centos版本
function get_centos_version()
{
    version=`cat /etc/redhat-release | awk '{print $4}' | awk -F . '{printf "%s",$1}'`
    echo $version
}

# 判断是否是macOS10.14版本
function is_macos1014()
{
    product_version=$(sw_vers | grep ProductVersion)
    if [[ $product_version =~ "10.14" ]]; then
        echo 1
    else
        echo 0
    fi
}

# 在ubuntu上源代码安装Vim
function compile_vim_on_ubuntu()
{
    sudo apt-get install -y libncurses5-dev libncurses5 libgnome2-dev libgnomeui-dev \
        libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
        libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev python3-dev ruby-dev lua5.1 lua5.1-dev

    rm -rf ~/vim82
    git clone https://gitee.com/chxuan/vim82.git ~/vim82
    cd ~/vim82
    ./configure --with-features=huge \
        --enable-multibyte \
        --enable-rubyinterp \
        --enable-pythoninterp \
        --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
        --enable-perlinterp \
        --enable-luainterp \
        --enable-gui=gtk2 \
        --enable-cscope \
        --prefix=/usr
    make
    sudo make install
    cd -
}

# 在debian上源代码安装vim
function compile_vim_on_debian()
{
    sudo apt-get install -y libncurses5-dev libncurses5 libgtk2.0-dev libatk1.0-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev python3-dev ruby-dev lua5.1 lua5.1-dev

    rm -rf ~/vim82
    git clone https://gitee.com/chxuan/vim82.git ~/vim82
    cd ~/vim82
    ./configure --with-features=huge \
        --enable-multibyte \
        --enable-rubyinterp \
        --enable-pythoninterp \
        --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
        --enable-perlinterp \
        --enable-luainterp \
        --enable-gui=gtk2 \
        --enable-cscope \
        --prefix=/usr
    make
    sudo make install
    cd -
}

# 在centos上源代码安装vim
function compile_vim_on_centos()
{
    sudo yum install -y ruby ruby-devel lua lua-devel luajit \
        luajit-devel ctags git python python-devel \
        python34 python34-devel tcl-devel \
        perl perl-devel perl-ExtUtils-ParseXS \
        perl-ExtUtils-XSpp perl-ExtUtils-CBuilder \
        perl-ExtUtils-Embed libX11-devel ncurses-devel

    rm -rf ~/vim82
    git clone https://gitee.com/chxuan/vim82.git ~/vim82
    cd ~/vim82
    ./configure --with-features=huge \
        --enable-multibyte \
        --with-tlib=tinfo \
        --enable-rubyinterp=yes \
        --enable-pythoninterp=yes \
        --with-python-config-dir=/lib64/python2.7/config \
        --enable-perlinterp=yes \
        --enable-luainterp=yes \
        --enable-gui=gtk2 \
        --enable-cscope \
        --prefix=/usr
    make
    sudo make install
    cd -
}

# 安装mac平台必备软件
function install_prepare_software_on_mac()
{
    xcode-select --install

    brew install vim gcc cmake ctags-exuberant ack

    macos1014=$(is_macos1014)
    if [ $macos1014 == 1 ]; then
        open /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg
    fi
}

# 安装android平台必备软件
function install_prepare_software_on_android()
{
    pkg update
    pkg install -y git vim-python cmake python2 python ctags ack-grep ncurses-utils
}

# 安装ubuntu必备软件
function install_prepare_software_on_ubuntu()
{
    sudo apt-get update

    version=$(get_ubuntu_version)
    if [ $version -eq 14 ];then
        sudo apt-get install -y cmake3
    else
        sudo apt-get install -y cmake
    fi

    sudo apt-get install -y exuberant-ctags build-essential python python-dev python3-dev fontconfig libfile-next-perl ack-grep git

    if [ $version -ge 18 ];then
        sudo apt-get install -y vim
    else
        compile_vim_on_ubuntu
    fi
}


# 安装ubuntu系必备软件
function install_prepare_software_on_ubuntu_like()
{
    sudo apt-get update
    sudo apt-get install -y cmake exuberant-ctags build-essential python python-dev python3-dev fontconfig libfile-next-perl ack-grep git
    compile_vim_on_ubuntu
}


# 安装debian必备软件
function install_prepare_software_on_debian()
{
    sudo apt-get update
    sudo apt-get install -y cmake exuberant-ctags build-essential python python-dev python3-dev fontconfig libfile-next-perl ack git
    compile_vim_on_debian
}


# 安装centos必备软件
function install_prepare_software_on_centos()
{
    version=$(get_centos_version)
    if [ $version -ge 8 ];then
        sudo dnf install -y epel-release
        sudo dnf install -y vim ctags automake gcc gcc-c++ kernel-devel make cmake python2 python2-devel python3-devel fontconfig ack git
    else
        sudo yum install -y ctags automake gcc gcc-c++ kernel-devel cmake python-devel python3-devel fontconfig ack git
        compile_vim_on_centos
    fi
}


# 安装fedora必备软件
function install_prepare_software_on_fedora()
{
    sudo dnf install -y vim ctags automake gcc gcc-c++ kernel-devel cmake python-devel python3-devel fontconfig ack git
}


# 安装archlinux必备软件
function install_prepare_software_on_archlinux()
{
    sudo pacman -S --noconfirm vim ctags automake gcc cmake python3 python2 ack git fontconfig
    sudo ln -s /usr/lib/libtinfo.so.6 /usr/lib/libtinfo.so.5
}


# 安装gentoo必备软件
function install_prepare_software_on_gentoo()
{
    install_software_on_gentoo app-editors/vim dev-util/ctags sys-devel/automake sys-devel/gcc dev-util/cmake sys-apps/ack dev-vcs/git media-libs/fontconfig
    su - -c "ln -s /usr/lib/libtinfo.so.6 /usr/lib/libtinfo.so.5" -s /bin/bash
}


function install_software_on_gentoo()
{
    pkgs=$*
    pkg_need_install=""
    for pkg in ${pkgs}
    do
        if qlist -I | grep -Eq $pkg; then
            echo "$pkg is already installed."
        else
            pkg_need_install="$pkg_need_install $pkg"
        fi
    done

    if sudo -l | grep -Eq "emerge"; then
        sudo emerge -v $pkg_need_install
    else
        echo "Need Root password:"
        su - -c "emerge -v $pkg_need_install" -s /bin/bash
    fi
}


# 安装opensuse必备软件
function install_prepare_software_on_opensuse()
{
    sudo zypper install -y vim ctags gcc gcc-c++ cmake python-devel python3-devel ack fontconfig git ncurses5-devel
}


# 拷贝文件
function copy_files()
{
    rm -rf ~/.vimrc
    ln -s ${PWD}/.vimrc ~

    rm -rf ~/.vimrc.custom.plugins
    cp ${PWD}/.vimrc.custom.plugins ~

    rm -rf ~/.vimrc.custom.config
    cp ${PWD}/.vimrc.custom.config ~

    rm -rf ~/.ycm_extra_conf.py
    ln -s ${PWD}/.ycm_extra_conf.py ~

    mkdir ~/.vim
    rm -rf ~/.vim/colors
    ln -s ${PWD}/colors ~/.vim

    rm -rf ~/.vim/ftplugin
    ln -s ${PWD}/ftplugin ~/.vim

    rm -rf ~/.vim/autoload
    ln -s ${PWD}/autoload ~/.vim
}


# 安装mac平台字体
function install_fonts_on_mac()
{
    rm -rf ~/Library/Fonts/Droid\ Sans\ Mono\ Nerd\ Font\ Complete.otf
    cp ./fonts/Droid\ Sans\ Mono\ Nerd\ Font\ Complete.otf ~/Library/Fonts
}


# 安装android平台字体
function install_fonts_on_android()
{
    rm -rf ~/.termux/font.ttf
    mkdir ~/.termux
    cp ./fonts/DejaVu.ttf ~/.termux/font.ttf

    # 刷新style
    REL="am broadcast --user 0 -a com.termux.app.reload_style com.termux"
    $REL > /dev/null
}


# 安装linux平台字体
function install_fonts_on_linux()
{
    mkdir -p ~/.local/share/fonts
    rm -rf ~/.local/share/fonts/Droid\ Sans\ Mono\ Nerd\ Font\ Complete.otf
    cp ./fonts/Droid\ Sans\ Mono\ Nerd\ Font\ Complete.otf ~/.local/share/fonts

    fc-cache -vf ~/.local/share/fonts
}


# 安装vim插件
function install_vim_plugin()
{
    vim -c "PlugInstall" -c "q" -c "q"
}


# 安装ycm插件
function install_ycm()
{
    git clone https://gitee.com/chxuan/YouCompleteMe-clang.git ~/.vim/plugged/YouCompleteMe
    cd ~/.vim/plugged/YouCompleteMe
    read -p "Please choose to compile ycm with python2 or python3, if there is a problem with the current selection, please choose another one. [2/3] " version
    if [[ $version == "2" ]]; then
        echo "Compile ycm with python2."
        python2.7 ./install.py --clang-completer
    else
        echo "Compile ycm with python3."
        python3 ./install.py --clang-completer
    fi
}


# 在android上安装ycm插件
function install_ycm_on_android()
{
    git clone https://gitee.com/chxuan/YouCompleteMe-clang.git ~/.vim/plugged/YouCompleteMe

    cd ~/.vim/plugged/YouCompleteMe

    read -p "Please choose to compile ycm with python2 or python3, if there is a problem with the current selection, please choose another one. [2/3] " version
    if [[ $version == "2" ]]; then
        echo "Compile ycm with python2."
        python2.7 ./install.py --clang-completer --system-libclang
    else
        echo "Compile ycm with python3."
        python3 ./install.py --clang-completer --system-libclang
    fi
}


# 打印logo
function print_logo()
{
    color="$(tput setaf 6)"
    normal="$(tput sgr0)"
    printf "${color}"
    echo ''
	echo ''
    echo '+=====================================================================================+'
    echo '+                                                                                     +'
    echo '+                       __      ___           _  __     _ _                           +'
    echo '+                       \ \    / (_)         | |/ /    | (_)                          +'
    echo '+                        \ \  / / _ _ __ ___ | * /_   _| |_ _ __                      +'
    echo '+                         \ \/ / | | *_ ` _ \|  <| | | | | | *_ \                     +'
    echo '+                          \  /  | | | | | | | * \ |_| | | | | | |                    +'
    echo '+                           \/   |_|_| |_| |_|_|\_\__, |_|_|_| |_|                    +'
    echo '+                                                  __/ |                              +'
    echo '+                                                 |___/                               +'
    echo '+                                                                                     +'
    echo '+                                  Just enjoy it!                                     +'
    echo '+                                author:coco-linux                                    +'
    echo '+                             email:2673483151@qq.com                                 +'
    echo '+                          Simple,  fast  and  efficient.                             +'
    echo '+            Direction determines the road, the road determines the fate.             +'
    echo '+        wellcome to my github ——https://github.com/TorvaldsRodriguez/VimKylin        +'
    echo '+=====================================================================================+'
	echo ''
	echo ''
    printf "${normal}"
}


# 在mac平台安装VimKylin
function install_VimKylin_on_MacOS()
{
    backup_vimrc_and_vim
    install_prepare_software_on_mac
    copy_files
    install_fonts_on_mac
    install_ycm
    install_vim_plugin
    print_logo
}


# 在android平台安装VimKylin
function install_VimKylin_on_Android()
{
    backup_vimrc_and_vim
    install_prepare_software_on_android
    copy_files
    install_fonts_on_android
    install_ycm_on_android
    install_vim_plugin
    print_logo
}


# 开始安装VimKylin
function begin_install_VimKylin()
{
    copy_files
    install_fonts_on_linux
    install_ycm
    install_vim_plugin
    print_logo
}


# 在ubuntu上安装VimKylin
function install_VimKylin_on_ubuntu()
{
    backup_vimrc_and_vim
    install_prepare_software_on_ubuntu
    begin_install_VimKylin
}


# 在ubuntu系上安装VimKylin
function install_VimKylin_on_ubuntu_like()
{
    backup_vimrc_and_vim
    install_prepare_software_on_ubuntu_like
    begin_install_VimKylin
}


# 在debian上安装VimKylin
function install_VimKylin_on_debian()
{
    backup_vimrc_and_vim
    install_prepare_software_on_debian
    begin_install_VimKylin
}


# 在centos上安装VimKylin
function install_VimKylin_on_centos()
{
    backup_vimrc_and_vim
    install_prepare_software_on_centos
    begin_install_VimKylin
}


# 在fedora上安装VimKylin
function install_VimKylin_on_fedora()
{
    backup_vimrc_and_vim
    install_prepare_software_on_fedora
    begin_install_VimKylin
}

# 在archlinux上安装VimKylin
function install_VimKylin_on_archlinux()
{
    backup_vimrc_and_vim
    install_prepare_software_on_archlinux
    begin_install_VimKylin
}


# 在Gentoo上安装VimKylin
function install_VimKylin_on_gentoo()
{
    backup_vimrc_and_vim
    install_prepare_software_on_gentoo
    begin_install_VimKylin
}


# 在opensuse上安装VimKylin
function install_VimKylin_on_OpenSUSE()
{
    backup_vimrc_and_vim
    install_prepare_software_on_opensuse
    begin_install_VimKylin
}


# 在linux平上台安装VimKylin
function install_VimKylin_on_linux()
{
    distro=`get_linux_distro`
    echo "Linux distro: "${distro}

    if [ ${distro} == "Ubuntu" ]; then
        install_VimKylin_on_ubuntu
    elif [ ${distro} == "Deepin" ]; then
        install_VimKylin_on_ubuntu_like
    elif [ ${distro} == "LinuxMint" ]; then
        install_VimKylin_on_ubuntu_like
    elif [ ${distro} == "elementaryOS" ]; then
        install_VimKylin_on_ubuntu_like
    elif [ ${distro} == "Debian" ]; then
        install_VimKylin_on_debian
    elif [ ${distro} == "UOS" ]; then
        install_VimKylin_on_debian
    elif [ ${distro} == "Kali" ]; then
        install_VimKylin_on_debian
    elif [ ${distro} == "CentOS" ]; then
        install_VimKylin_on_centos
    elif [ ${distro} == "fedora" ]; then
        install_VimKylin_on_fedora
    elif [ ${distro} == "openSUSE" ]; then
        install_VimKylin_on_OpenSUSE
    elif [ ${distro} == "ArchLinux" ]; then
        install_VimKylin_on_archlinux
    elif [ ${distro} == "ManjaroLinux" ]; then
        install_VimKylin_on_archlinux
    elif [ ${distro} == "Gentoo" ]; then
        install_VimKylin_on_gentoo
    else
        echo "Not support linux distro: "${distro}
    fi
}


# 获取当前时间戳
function get_now_timestamp()
{
    cur_sec_and_ns=`date '+%s-%N'`
    echo ${cur_sec_and_ns%-*}
}


# 配置在使用ycm/cscope补全、跳转时所需的Linux内核环境
function configuring_complex_environments()
{
	echo "Install formatting code tools, such as Astyle and Python-autopep8."
	sudo apt install astyle
	sudo apt install python-autopep8
	echo "---------------Begining install aptitude now.---------------"
	sudo apt-get install aptitude
	echo "See which ctags exist on the current system."
	aptitude search ctags
	echo "---------------Begining install ctags now.---------------"
	sudo apt-get install ctags
	echo "---------------Begining install cscope now.---------------"
	sudo apt-get install cscope
	echo "---------------Begining install global now.---------------"
    sudo apt install global
	echo "Enter the Linux-Kernel-4.1.15 directory."
	cd $HOME/linux-kernel/linux-kernel-4.1.15
	echo "The current directory path is:${PWD}"
	echo "In the kernel root directory, execute gtags to generate GPATH and GRTAGS."
	echo "Please wait for a few minutes."
	gtags
	echo "The following commands were executed in the kernel root directory:"
	echo "export ARCH=arm"
	export ARCH=arm
	echo "export CROSS_COMPILE=arm-linux-gnueabi-"
	export CROSS_COMPILE=arm-linux-gnueabi-
	echo "make tags cscope TAGS"
	echo "Please wait for a few minutes."
	make tags cscope TAGS
	cd ${HOME}/.VimKylin
	echo "The current directory path is:${PWD}"
}


# 配置普通环境
function configuring_general_environment()
{
    cd ${HOME}
    echo "The current directory path is:${PWD}"
	echo "Create a directory for the Linux kernel."
	mkdir linux-kernel
	echo "View the contents of the current user directory."
	ls -la
	cd ${HOME}/linux-kernel
	echo "The current directory path is:${PWD}"
	echo "Download the Linux kernel source code.Just a moment, please."
	git clone https://gitee.com/coco-linux/linux-kernel-4.1.15.git
    echo "Installation dependencies:lsb-core lib32stdc++6"
	sudo apt-get install lsb-core lib32stdc++6
    cd ${HOME}
    echo "The current directory path is:${PWD}"
	echo "mkdir /usr/local/arm."
	sudo mkdir /usr/local/arm
	echo "Download the cross-compiler into the /usr/local/arm directory."
	cd /usr/local/arm
	echo "The current directory path is:${PWD}"
	sudo git clone https://gitee.com/coco-linux/gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf.git
    cd ${HOME}
    echo "The current directory path is:${PWD}"
    echo "Please use the mouse to copy the following content to the system clipboard."
    echo "------------------------------------------"
    echo "export PATH=$PATH:/usr/local/arm/gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf/bin"
    echo "------------------------------------------"
	echo "Use the Vim editor to type the contents of the system paste board into the end of the /etc/profile file."
	sudo vim /etc/profile
	echo "View the contents of the /etc/profile file."
	cat /etc/profile
    echo "The current directory path is:${PWD}"
	echo "View the information for the cross-compiler."
	arm-linux-gnueabihf-gcc -v
	echo "Start configuring the complex environment."
	configuring_complex_environments
}


# VimKylinMain函数
function VimKylinMain()
{
    begin=`get_now_timestamp`
	# configuring_general_environment
	echo "Commence installation of VimKylin."
    type=$(uname)
    echo "Platform type: "${type}

    if [ ${type} == "Darwin" ]; then
        install_VimKylin_on_MacOS
    elif [ ${type} == "Linux" ]; then
        tp=$(uname -a)
        if [[ $tp =~ "Android" ]]; then
            echo "Android"
            install_VimKylin_on_Android
        else
            install_VimKylin_on_linux
        fi
    else
        echo "Not support platform type: "${type}
    fi

	cd ${HOME}/.VimKylin/
	echo "The current directory path is:${PWD}"
	echo "Create the symbolic link file in the kernel root directory."
	ln -s ${PWD}/.ycm_extra_conf.py /home/coco-linux/linux-kernel/linux-kernel-4.1.15/
	cd ${HOME}
	echo "The current directory path is:${PWD}"
	ls
    end=`get_now_timestamp`
    second=`expr ${end} - ${begin}`
    min=`expr ${second} / 60`
	echo "Finish installing VimKylin."
    echo "It takes "${min}" minutes."
}


# 调用VimKylinMain函数
echo -n "You will install VimKylin(include YouCompleteMe...) without GUI,are you sure[y/n]"
read  your_option
if [ ${your_option} == "y" ]; then
    echo "Install VimKylin begining..."
    echo "Please wait for a few minutes."
    VimKylinMain
else
    echo "Sorry!Stop install VimKylin"
fi
