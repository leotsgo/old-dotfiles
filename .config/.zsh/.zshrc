# Uses gpg-agent instead of ssh-agent
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# alternative to p10k theme
# autoload -U colors && colors
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# ZSH HISTORY
HISTSIZE=100000000
SAVEHIST=100000000
HISTFILE=~/.config/.zsh/.zsh_history

# Source p10k
ZLE_RPROMPT_INDENT=0
source ~/.config/.zsh/powerlevel10k/powerlevel10k.zsh-theme

# Source zsh-history-substring-search
source ~/.config/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=(bg=green,bold)
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=(bg=red,bold)
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=true
bindkey -v
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# Source zsh-autosuggestions
source ~/.config/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Source zsh-vi-mode
ZVM_VI_ESCAPE_BINDKEY=jj
source $HOME/.config/.zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh
ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE

# Source asdf
. $HOME/.asdf/asdf.sh
PATH=$PATH:$(asdf where nodejs)/bin # adds node to PATH
# PATH=$PATH:$(asdf where python)/bin # adds python to PATH
# PATH=$PATH:$(asdf where golang)/go/bin # adds go to PATH

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)

# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select # Enable tab completion menu
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' '+l:|=* r:|=*' # Enable tab completion based on what's already written

# Source aliases
source $HOME/.config/.zsh/aliases.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f ~/google-cloud-sdk/path.zsh.inc ]; then . ~/google-cloud-sdk/path.zsh.inc; fi

# The next line enables shell command completion for gcloud.
if [ -f ~/google-cloud-sdk/completion.zsh.inc ]; then . ~/google-cloud-sdk/completion.zsh.inc; fi

# The next line enables shell command completion for kubectl
source <(kubectl completion zsh)

# KREW
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# asdf-direnv
source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"

# exports
export SUDO_EDITOR=$(asdf which nvim)
export GOPATH="$HOME/go"
export ZSH_COMPDUMP=~/.cache/.zcompdump-$HOST

# Source zsh-syntax-highlighting
source ~/.config/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Edit .zshrc and add this line
export PATH=$HOME/.config/rofi/scripts:$PATH
