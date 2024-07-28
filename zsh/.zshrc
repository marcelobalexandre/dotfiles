. "$HOME/.zshrc.powerlevel10k"
. "$HOME/.zshrc.oh-my-zsh"
. "$HOME/.zshrc.fzf"
. "$HOME/.zshrc.aliases"
. "$HOME/.zshrc.keybindings"

export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
export BROWSER=firefox

# fzf
eval "$(fzf --zsh)"

# mise
eval "$(mise activate zsh)"

# pnpm
export PNPM_HOME="/home/marcelo/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Swap Caps Lock with Escape
if [[ "$OSTYPE" != "darwin"* ]]; then
  setxkbmap -option caps:swapescape
fi

if test -f "$HOME/.zshrc.godaddy"; then
  . "$HOME/.zshrc.godaddy"
fi
