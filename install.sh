#!/usr/bin/env bash

show_help() {
    echo "Usage: install.sh [OPTION] ..."
    echo "This script setup the environment for daily usage, there are several"
    echo "options can be configured as below:"
    echo "  -h    show this help description"
    echo "  -m    setup the mosh server"
    exit 0
}

get_cli_arg() {
    . /etc/os-release

    DISTRIBUTION=$ID
    MOSH_SUPPORT=false

    for i in "$@"; do
        case $1 in
            -h) show_help ;;
            -m) MOSH_SUPPORT=true ;;
        esac
        shift
    done

    echo "DISTRIBUTION   = ${DISTRIBUTION}"
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
}

install_requirements_from_package_management_system() {
    REQUIREMENTS="tmux zsh ripgrep"

    if [ "$DISTRIBUTION" = "elementary" ] || [ "$DISTRIBUTION" = "ubuntu" ]; then
        PYTHON="python3-dev python3-pip"
        REQUIREMENTS="${REQUIREMENTS} build-essential csvtool silversearcher-ag"
    else # including arch & manjaro
        PYTHON="python python-pip"
        REQUIREMENTS="${REQUIREMENTS} base-devel the_silver_searcher"
    fi

    REQUIREMENTS="${REQUIREMENTS} ${PYTHON}"

    if [ "$MOSH_SUPPORT" = "true" ]; then
        REQUIREMENTS="${REQUIREMENTS} mosh"
    fi

    sudo $PKG_DB_UPDATE
    sudo $PKG_INSTALL $REQUIREMENTS
}

install_requirements_from_non_package_management_system() {
    # fzf installation
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install

    if [ "$DISTRIBUTION" = "arch" ] || [ "$DISTRIBUTION" = "manjaro" ]; then
        # yay installation
	mkdir /tmp/yay-install
        git clone https://aur.archlinux.org/yay.git /tmp/yay-install/yay
        (cd /tmp/yay-install/yay && makepkg -si)
        rm -rf /tmp/yay-install

        # tabview installation
        yay -S tabview
    fi
}


install_and_set_zsh() {
    # Install zplug
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

    chsh -s `which zsh`

    # TODO
    # 1. install zplug plugins and update the .zsh theme
    # 2. make directory ~/.zplug/repos/woefe/git-prompt.zsh/simple
    # 3. soft link the simple.zsh in ~/.zplug/repos/woefe/git-prompt.zsh/simple
}


install_and_set_tmux() {
    ln -fs `pwd`/tmux/tmux.conf ~/.tmux.conf
}


install_and_set_git() {
    cp `pwd`/git/gitconfig ~/.gitconfig
    ln -fs `pwd`/git/gitmessage.txt ~/.gitmessage.txt
}


install_and_set_neovim() {
    mkdir -p ~/.config

    ln -fs `pwd`/nvim ~/.config/nvim

    # TODO: install neovim packages
    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
}


main() {
    get_cli_arg "$@"
    init_variables

    echo installing requirements ...
    install_requirements_from_package_management_system
    install_requirements_from_non_package_management_system

    echo installing and setting zsh ...
    install_and_set_zsh

    echo installing and setting tmux ...
    install_and_set_tmux

    echo installing and setting gitconfig ...
    install_and_set_git

    echo installing and setting neovim ...
    install_and_set_neovim
}

main "$@"
