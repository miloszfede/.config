# Set up environment
eval "$(/opt/homebrew/bin/brew shellenv)"

# Starship prompt
starship init fish | source

# Bun config
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Vim alias
function vim
    nvim $argv
end

# Start tmux automatically if not already in tmux and in interactive session
if status is-interactive
    and not set -q TMUX
    exec tmux
end

