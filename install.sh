#!/usr/bin/env bash


show_help() {
    echo "Usage: install.sh [OPTION] ..."
    echo "This script setup the environment for daily usage, there are several"
    echo "options can be configured as below:"
    echo "  -h    show this help description"
    exit 0
}


get_cli_arg() {
    . /etc/os-release

    DISTRIBUTION=$ID

    for _ in "$@"; do
        case $1 in
            -h) show_help ;;
        esac
        shift
    done

    echo "DISTRIBUTION   = ${DISTRIBUTION}"
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
    REQUIREMENTS="tmux zsh ripgrep fzf mosh neovim"

    if [ "$DISTRIBUTION" = "elementary" ] || [ "$DISTRIBUTION" = "ubuntu" ]; then
        PYTHON="python3-dev python3-pip"
        REQUIREMENTS="${REQUIREMENTS} build-essential silversearcher-ag"
    else # including arch & manjaro
        PYTHON="python python-pip"
        REQUIREMENTS="${REQUIREMENTS} base-devel the_silver_searcher"
    fi

    REQUIREMENTS="${REQUIREMENTS} ${PYTHON}"

    sudo "$PKG_DB_UPDATE"
    sudo "$PKG_INSTALL $REQUIREMENTS"
}


install_requirements_from_non_package_management_system() {
    if [ "$DISTRIBUTION" = "arch" ] || [ "$DISTRIBUTION" = "manjaro" ]; then
        # yay installation
        mkdir /tmp/yay-install
        git clone https://aur.archlinux.org/yay.git /tmp/yay-install/yay
        (cd /tmp/yay-install/yay && makepkg -si)
        rm -rf /tmp/yay-install
    fi
}


install_and_set_zsh() {
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

    while [ ! -f ~/.zplug/init.zsh ] ; do
        sleep 1
    done

    zsh zsh/zplug_install.zsh
    ln -fs "$(pwd)"/zsh/zshrc ~/.zshrc
    ln -fs "$(pwd)"/zsh/simple.zsh ~/.zplug/repos/woefe/git-prompt.zsh/simple.zsh

    chsh -s "$(which zsh)"
}


install_and_set_tmux() {
    ln -fs "$(pwd)"/tmux/tmux.conf ~/.tmux.conf
}


install_and_set_git() {
    cp "$(pwd)"/git/gitconfig ~/.gitconfig
    ln -fs "$(pwd)"/git/gitmessage.txt ~/.gitmessage.txt
}


install_and_set_neovim() {
    mkdir -p ~/.config
    ln -fs "$(pwd)"/nvim ~/.config/nvim
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
