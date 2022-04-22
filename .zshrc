# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# SET THEME
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Auto correction
# ENABLE_CORRECTION="true"

# oh-my-zsh plugins
plugins=(git zsh-syntax-highlighting gitfast zsh-autosuggestions vi-mode) 

# source oh-my-zsh
source $ZSH/oh-my-zsh.sh

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

# alias for p10k update with oh-my-zsh
alias p10k-update='git -C ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k pull'

# KREW
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# opam configuration
[[ ! -r /home/leonardo.diniz/.opam/opam-init/init.zsh ]] || source /home/leonardo.diniz/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"
