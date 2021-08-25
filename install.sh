#!/usr/bin/env bash

show_help() {
    echo "Usage: install.sh [OPTION] ..."
    echo "This script setup the environment for daily usage, there are several"
    echo "options can be configured as below:"
    echo "  -h    show this help description"
    echo "  -c    setup the environment to support C/C++ development"
    echo "  -p    setup the environment to support python development"
    echo "  -g    setup the environment to support golang development"
    echo "  -w    setup the environment includes the tools for windows manager"
    echo "  -d    setup the environment for docker deployment"
    echo "  -m    setup the mosh server"
    exit 0
}

get_cli_arg() {
    . /etc/os-release

    DISTRIBUTION=$ID
    C_DEV_SUPPORT=false
    P_DEV_SUPPORT=false
    G_DEV_SUPPORT=false
    WM_SUPPORT=false
    DOCKER_SUPPORT=false
    MOSH_SUPPORT=false

    for i in "$@"; do
        case $1 in
            -h) show_help ;;
            -c) C_DEV_SUPPORT=true ;;
            -p) P_DEV_SUPPORT=true ;;
            -g) G_DEV_SUPPORT=true ;;
            -w) WM_SUPPORT=true ;;
            -d) DOCKER_SUPPORT=true ;;
            -m) MOSH_SUPPORT=true ;;
        esac
        shift
    done

    echo "DISTRIBUTION   = ${DISTRIBUTION}"
    echo "C_DEV_SUPPORT  = ${C_DEV_SUPPORT}"
    echo "P_DEV_SUPPORT  = ${P_DEV_SUPPORT}"
    echo "G_DEV_SUPPORT  = ${G_DEV_SUPPORT}"
    echo "WM_SUPPORT     = ${WM_SUPPORT}"
    echo "DOCKER_SUPPORT = ${DOCKER_SUPPORT}"
    echo "MOSH_SUPPORT   = ${MOSH_SUPPORT}"
}

init_variables() {
    if [ "$DISTRIBUTION" = "elementary" ] || [ "$DISTRIBUTION" = "ubuntu" ]; then
        PKG_INSTALL="apt install"
        PKG_DB_UPDATE="apt update"
    elif [ "$DISTRIBUTION" = "arch" ] || [ "$DISTRIBUTION" = "manjaro" ]; then
        PKG_INSTALL="pacman -S"
        PKG_DB_UPDATE="pacman -Syy"
    else
        echo "Unsupported linux distribution found (${DISTRIBUTION})"
        exit 1
    fi

    if [ "$G_DEV_SUPPORT" = "true" ]; then
        export GOPATH=~/.golang
    fi
}

install_requirements_from_package_management_system() {
    REQUIREMENTS="tmux zsh ripgrep"

    if [ "$DISTRIBUTION" = "elementary" ] || [ "$DISTRIBUTION" = "ubuntu" ]; then
        PYTHON="python3-dev python3-pip"
        GOLANG="golang"
        REQUIREMENTS="${REQUIREMENTS} build-essential csvtool silversearcher-ag"
    else # including arch & manjaro
        PYTHON="python python-pip"
        GOLANG="go"
        REQUIREMENTS="${REQUIREMENTS} base-devel the_silver_searcher"
    fi

    if [ "$C_DEV_SUPPORT" = "true" ]; then
        REQUIREMENTS="${REQUIREMENTS} cscope cmake"
    fi

    if [ "$P_DEV_SUPPORT" = "true" ]; then
        REQUIREMENTS="${REQUIREMENTS} ${PYTHON}"
    fi

    if [ "$G_DEV_SUPPORT" = "true" ]; then
        REQUIREMENTS="${REQUIREMENTS} ${GOLANG}"
    fi

    if [ "$WM_SUPPORT" = "true" ]; then
        REQUIREMENTS="${REQUIREMENTS} guake gcin"
    fi

    if [ "$MOSH_SUPPORT" = "true" ]; then
        REQUIREMENTS="${REQUIREMENTS} mosh"
    fi

    sudo $PKG_DB_UPDATE
    sudo $PKG_INSTALL $REQUIREMENTS
}

install_requirements_from_non_package_management_system() {
    if [ "$DISTRIBUTION" = "arch" ] || [ "$DISTRIBUTION" = "manjaro" ]; then
        # yay installation
	mkdir /tmp/yay-install
        git clone https://aur.archlinux.org/yay.git /tmp/yay-install/yay
        (cd /tmp/yay-install/yay && makepkg -si)
        rm -rf /tmp/yay-install

        # tabview installation
        yay -S tabview
    fi

    if [ "$G_DEV_SUPPORT" = "true" ]; then
        go get -u golang.org/x/lint/golint
        sudo ln -sf $(go list -f {{.Target}} golang.org/x/lint/golint) /bin/golint
    fi

    if [ "$DOCKER_SUPPORT" = "true" ]; then
        if [ "$DISTRIBUTION" = "elementary" ] || [ "$DISTRIBUTION" = "ubuntu" ]; then
            sudo $PKG_INSTALL apt-transport-https ca-certificates curl gnupg2 software-properties-common
	    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	    apt-key fingerprint 0EBFCD88
	    add-apt-repository  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
	        $(lsb_release -cs) stable"
            sudo $PKG_INSTALL docker-ce
        else # including arch & manjaro
            sudo $PKG_INSTALL docker
        fi
    fi

}

install_and_set_ohmyzsh() {
    # TODO: survey zsh + zplug (https://www.jkg.tw/p2965/)

    # "https://git.io/vhqYi" is the shorten URL of oh-my-zsh installation script
    # which allows batch mode and is updated in pull requests #5893, link is as
    # below:
    # "https://github.com/robbyrussell/oh-my-zsh/pull/5893"
    sh -c "$(curl -fsSL https://git.io/vhqYi)" -s --batch || {
        echo "Could not install Oh My Zsh" >/dev/stderr
        exit 1
    }

    cp `pwd`/zsh/zshrc ~/.zshrc
    ln -fs `pwd`/zsh/mytheme.zsh-theme ~/.oh-my-zsh/themes/mytheme.zsh-theme

    if [ "$G_DEV_SUPPORT" = "true" ]; then
        echo "export GOPATH=~/.golang" >> ~/.zshrc
    fi
}


install_and_set_tmux() {
    ln -fs `pwd`/tmux/tmux.conf ~/.tmux.conf
}


install_and_set_git() {
    cp `pwd`/git/gitconfig ~/.gitconfig
}


install_and_set_vim() {
    ln -fs `pwd`/vim/vimrc ~/.vimrc
    ln -fs `pwd`/vim/ycm_extra_conf.py ~/.ycm_extra_conf.py

    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    vim +PluginInstall +qall

    COMPLETER=""

    if [ "$C_DEV_SUPPORT" = "true" ]; then
	COMPLETER="${COMPLETER} --clang-completer"
    fi

    if [ "$G_DEV_SUPPORT" = "true" ]; then
        vim +GoInstallBinaries +qall
	COMPLETER="${COMPLETER} --go-completer"
    fi

    if [ "$C_DEV_SUPPORT" = "true" ] || [ "$G_DEV_SUPPORT" = "true" ]; then
        ~/.vim/bundle/YouCompleteMe/install.py $COMPLETER
    fi

    ln -fs `pwd`/vim/ftplugin ~/.vim/ftplugin
}


main() {
    get_cli_arg "$@"
    init_variables

    echo installing requirements ...
    install_requirements_from_package_management_system
    install_requirements_from_non_package_management_system

    echo installing and setting oh-my-zsh ...
    install_and_set_ohmyzsh

    echo installing and setting tmux ...
    install_and_set_tmux

    echo installing and setting gitconfig ...
    install_and_set_git

    echo installing and setting vim ...
    install_and_set_vim
}

main "$@"
