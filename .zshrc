# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ZSH HISTORY
HISTFILE=~/.zsh/.zsh_history
HISTSIZE=100000000
SAVEHIST=100000000

# Source p10k
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme

# Source zsh-syntax-highlighting
source /home/leonardo.diniz/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Source zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Source zsh-vi-mode
source $HOME/.zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Source aliases
source $HOME/.zsh/aliases.zsh

# SOURCE asdf
. $HOME/.asdf/asdf.sh

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)

# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/leonardo.diniz/google-cloud-sdk/path.zsh.inc' ]; then . '/home/leonardo.diniz/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/leonardo.diniz/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/leonardo.diniz/google-cloud-sdk/completion.zsh.inc'; fi

# The next line enables shell command completion for kubectl
source <(kubectl completion zsh)

# KREW
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# opam configuration
[[ ! -r /home/leonardo.diniz/.opam/opam-init/init.zsh ]] || source /home/leonardo.diniz/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# asdf-direnv
source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"

# useful aliases
alias vim="nvim"
alias update-nvim-stable='asdf uninstall neovim stable && asdf install neovim stable'
alias update-nvim-nightly='asdf uninstall neovim nightly && asdf install neovim nightly'
alias update-nvim-master='asdf uninstall neovim ref:master && asdf install neovim ref:master'
alias p10k-update='git -C ~/.zsh/powerlevel10k pull'

# exports
export SUDO_EDITOR=$(asdf which nvim)
