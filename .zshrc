# Created by newuser for 5.7.1
autoload -U compinit promptinit colors && colors
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search vcs_info
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
promptinit
compinit

# Git info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' formats "%{$fg[green]%}%s%{$fg[green]%}(%{$fg[yellow]%} %b%{$fg[green]%})%{$reset_color%}%m%u%c%{$reset_color%}"
precmd(){
	vcs_info
	
	#if [[ -n ${vcs_info_msg_0_} ]]; then
		# Oh hey, nothing from vcs_info, so we got more space.
	#	PROMPT='%B%F{cyan}%~%b%f%F{white} $%f '
	#else
		# vcs_info found something, that needs space. So a shortier PWD
	#	PROMPT='%B%F{cyan}%~%b%f%F{white}${vcs_info_msg_0_} $%f '


}

# Pywal
#(cat ~/.cache/wal/sequences &)

# Prompt
setopt prompt_subst
PROMPT='%B%F{cyan}%~%b%f%F{white} ${vcs_info_msg_0_}$%f '
RPROMPT="%F{yellow}%T%f"

# Historial
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Keybinds
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^?' backward-kill-word

[[ -n "${key[Up]}" ]] && bindkey -- "${key[Up]}" up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

# Aliases
alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias xmas='curl https://raw.githubusercontent.com/nisiddharth/Christmas-Bash-Script/master/Tree.sh | bash'

function sxiveh {
    case $@ in
        http*://*) curl -o sxivimage -s "$@" ; sxiv sxivimage ; rm sxivimage;;
        *) sxiv $@;;
    esac
}

export QT_STYLE_OVERRIDE='Adwaita-Dark'

#Este source siempre al final
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

