if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
end

eval "$(/opt/homebrew/bin/brew shellenv)"

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
