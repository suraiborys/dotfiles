# Environment variables
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# Directory navigation
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

# Completion settings
autoload -Uz compinit
compinit -u

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Menu selection for completion
zstyle ':completion:*' menu select

# Color completion for ls
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"

# Load plugins if they exist
# zsh-autosuggestions
if [[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# zsh-syntax-highlighting (must be loaded last)
if [[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi


# Initialize starship prompt
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
fi

# ---- FZF -----

# Set up fzf key bindings and fuzzy completion
if command -v fzf >/dev/null 2>&1; then
    eval "$(fzf --zsh)"
fi


if command -v fd >/dev/null 2>&1; then
    # -- Use fd instead of fzf --
    export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

    # Use fd (https://github.com/sharkdp/fd) for listing path candidates.
    # - The first argument to the function ($1) is the base path to start traversal
    # - See the source code (completion.{bash,zsh}) for the details.
    _fzf_compgen_path() {
      fd --hidden --exclude .git . "$1"
    }

    # Use fd to generate the list for directory completion
    _fzf_compgen_dir() {
      fd --type=d --hidden --exclude .git . "$1"
    }
fi

# ---- FZF-GIT -----

# Load fzf-git.sh for enhanced git integration with fzf
if [[ -f ~/fzf-git.sh/fzf-git.sh ]]; then
    source ~/fzf-git.sh/fzf-git.sh
fi

# Load local/custom settings if they exist
# This allows for user-specific configuration without committing to repo
if [[ -f ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi
