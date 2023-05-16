ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo " $(parse_git_dirty) ${ref#refs/heads/}%F{178}"
}

PROMPT='%B%F{178}➜ %n@%m %F{white}(%F{75}%1~$(git_prompt_info)%F{white})%{$reset_color%} '
