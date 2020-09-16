#!/bin/bash

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

# 更新mac平台字体
function update_fonts_on_mac()
{
    rm -rf ~/Library/Fonts/Droid\ Sans\ Mono\ Nerd\ Font\ Complete.otf
    cp ./fonts/Droid\ Sans\ Mono\ Nerd\ Font\ Complete.otf ~/Library/Fonts
}

# 更新android平台字体
function update_fonts_on_android()
{
    rm -rf ~/.termux/font.ttf
    mkdir ~/.termux
    cp ./fonts/DejaVu.ttf ~/.termux/font.ttf

    # 刷新style
    REL="am broadcast --user 0 -a com.termux.app.reload_style com.termux"
    $REL > /dev/null
}

# 更新linux平台字体
function update_fonts_on_linux()
{
    mkdir -p ~/.local/share/fonts
    rm -rf ~/.local/share/fonts/Droid\ Sans\ Mono\ Nerd\ Font\ Complete.otf
    cp ./fonts/Droid\ Sans\ Mono\ Nerd\ Font\ Complete.otf ~/.local/share/fonts

    fc-cache -vf ~/.local/share/fonts
}

# 更新vim插件
function update_vim_plugin()
{
    vim -c "PlugUpdate" -c "q" -c "q"
}

# 拷贝文件
function copy_files()
{
    rm -rf ~/.vimrc
    ln -s ${PWD}/.vimrc ~

    vimrc_plugins=$HOME"/.vimrc.custom.plugins"
    is_exist=$(is_exist_file $vimrc_plugins)
    if [ $is_exist != 1 ]; then
        cp ${PWD}/.vimrc.custom.plugins ~
    fi

    vimrc_config=$HOME"/.vimrc.custom.config"
    is_exist=$(is_exist_file $vimrc_config)
    if [ $is_exist != 1 ]; then
        cp ${PWD}/.vimrc.custom.config ~
    fi

    rm -rf ~/.ycm_extra_conf.py
    ln -s ${PWD}/.ycm_extra_conf.py ~

    rm -rf ~/.vim/colors
    ln -s ${PWD}/colors ~/.vim

    rm -rf ~/.vim/ftplugin
    ln -s ${PWD}/ftplugin ~/.vim

    rm -rf ~/.vim/autoload
    ln -s ${PWD}/autoload ~/.vim
}

# 打印logo
function print_logo()
{
    color="$(tput setaf 6)"
    normal="$(tput sgr0)"
    printf "${color}"
	echo ''
	echo '+=====================================================================================+'
	echo '+                                                                                     +'
	echo '+      _    _                                         __      ___                     +'
	echo '+     | |  | |                                        \ \    / (_)                    +'
	echo '+     | |__| | __ _ _ __ _ __ ___   ___  _ __  _   _   \ \  / / _ _ __ ___            +'
	echo '+     |  __  |/ _` | *__| *_ ^ _  */ _ *| *_ *| | | |   \ \/ / | | *_ ^ _  *          +'
	echo '+     | |  | | (_| | |  | | | | | | (_) | | | | |_| |    \  /  | | | | | | |          +'
	echo '+     |_|  |_|\__,_|_|  |_| |_| |_|\___/|_| |_|\__, |     \/   |_|_| |_| |_|          +'
	echo '+                                              ___/ |                                 +'
	echo '+                                             |____/                                  +'
	echo '+                                                                                     +'
	echo '+                                  Just enjoy it!                                     +'
	echo '+                                author:coco-linux                                    +'
	echo '+                             email:2673483151@qq.com                                 +'
	echo '+                          Simple,  fast  and  efficient.                             +'
	echo '+            Direction determines the road, the road determines the fate.             +'
	echo '+    wellcome to my github ——https://github.com/LinuxTorvaldsRodriguez/HarmonyVim     +'
	echo '+=====================================================================================+'
	echo ''
	echo ''
    printf "${normal}"
}

# 在mac更新HarmonyVim
function update_HarmonyVim_on_mac()
{
    git pull origin master
    copy_files
    update_fonts_on_mac
    update_vim_plugin
    print_logo
}

# 在linux更新HarmonyVim
function update_HarmonyVim_on_linux()
{
    git pull origin master
    copy_files
    update_fonts_on_linux
    update_vim_plugin
    print_logo
}

# 在android更新HarmonyVim
function update_HarmonyVim_on_android()
{
    git pull origin master
    copy_files
    update_fonts_on_android
    update_vim_plugin
    print_logo
}

# 获取当前时间戳
function get_now_timestamp()
{
    cur_sec_and_ns=`date '+%s-%N'`
    echo ${cur_sec_and_ns%-*}
}

# main函数
function main()
{
    begin=`get_now_timestamp`

    type=$(uname)
    echo "Platform type: "${type}

    if [ ${type} == "Darwin" ]; then
        update_HarmonyVim_on_mac
    elif [ ${type} == "Linux" ]; then
        tp=$(uname -a)
        if [[ $tp =~ "Android" ]]; then
            echo "Android"
            update_HarmonyVim_on_android
        else
            update_HarmonyVim_on_linux
        fi
    else
        echo "Not support platform type: "${type}
    fi

    end=`get_now_timestamp`
    second=`expr ${end} - ${begin}`
    min=`expr ${second} / 60`
    echo "It takes "${min}" minutes."
}


# 调用main函数
echo -n "You will update HarmonyVim(include YouCompleteMe...) without GUI,are you sure[y/n]"
read  your_option
if [ ${your_option} == "y" ]; then
    echo "Install HarmonyVim begining..."
    echo "Please wait for a few minutes."
    main
else
    echo "Sorry!Stop install HarmonyVim"
fi


