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

# rtx
export PATH="$HOME/bin:$PATH"
eval "$(rtx activate zsh)"

# Aliases
alias zsh.edit='vim ~/.zshrc'
alias zsh.reload='source ~/.zshrc'
alias tmux.edit='vim ~/.tmux.conf'
alias vim.edit='cd ~/.config/nvim && vim .'
alias hosts.edit='sudo vim /etc/hosts'
alias pacman.clean='sudo pacman -Rsn $(pacman -Qdtq)'
alias cd.home='cd ~/'
alias cd.config='cd ~/.config'
alias cd.aoc='cd ~/src/marcelobalexandre/advent-of-code'
alias git.undo='git reset HEAD~'
alias vim='nvim'

. "$HOME/.zshrc.godaddy"
