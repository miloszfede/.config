# Set up environment
eval "$(/opt/homebrew/bin/brew shellenv)"

# Starship prompt
starship init fish | source
zoxide init fish | source
fzf --fish | source
# Bun config
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Yazi config 
set -Ux PATH $HOME/.cargo/bin $PATH
alias y='yazi'

# Vim alias
function vim
    nvim $argv
end

# Start tmux automatically if not already in tmux and in interactive session
if status is-interactive
    and not set -q TMUX
    exec tmux
end

