# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

export EDITOR=usr/bin/vim
export VISUAL=usr/bin/vim 

# asdf
. "$HOME/.asdf/asdf.sh"
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit && compinit

# Aliases
alias zsh.edit='vim ~/.zshrc'
alias zsh.update='source ~/.zshrc'
alias tmux.edit='vim ~/.tmux.conf'
alias vim.edit='cd ~/.config/nvim && vim .'
alias hosts.edit='sudo vim /etc/hosts'
alias pacman.clean='sudo pacman -Rsn $(pacman -Qdtq)'
alias cd.home='cd ~/'
alias cd.aoc='cd ~/src/marcelobalexandre/advent-of-code'
alias git.undo='git reset HEAD~'
alias vim='nvim'

. "$HOME/.zshrc.godaddy"
