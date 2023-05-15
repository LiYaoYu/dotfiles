ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "%F{white}$(parse_git_dirty) ${ref#refs/heads/}%F{178} "
}

# PROMPT='%{$fg[blue]%}[%1~$(git_prompt_info)%{$fg[blue]%}] %{$reset_color%}'
PROMPT='%B%F{178}➜ %n@%m $(git_prompt_info)%{$reset_color%}'
