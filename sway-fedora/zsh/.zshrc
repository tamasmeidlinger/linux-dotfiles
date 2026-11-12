# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"


# ==============================
# FZF
# ==============================

export FZF_DEFAULT_OPTS="
  --style=minimal
  --layout=reverse
  --border=rounded
  --padding=0
  --info=inline
  --prompt=''
  --pointer='▶'
  --marker='✓'
  --color=bg:-1
  --color=fg:#C5C3B8
  --color=hl:#A6A394
  --color=fg+:#D5D1C4
  --color=bg+:#383A42
  --color=hl+:#D5D1C4
  --color=info:#929187
  --color=prompt:#A6A394
  --color=pointer:#C4BFAE
  --color=marker:#A6A394
  --color=spinner:#A6A394
  --color=header:#A6A394
  --color=border:#77766F
  --color=gutter:#A6A394
"

# FZF-TAB appearance
zstyle ':fzf-tab:*' fzf-flags \
  --height=60% \
  --layout=reverse \
  --border=rounded \
  --info=inline-right \
  --prompt='❯ ' \
  --pointer='❯' \
  --marker='▌' \
  --gutter=' ' \
  --color='bg:-1,bg+:-1' \
  --color='fg:#C5C3B8,fg+:#D5D1C4' \
  --color='hl:#A6A394,hl+:#D5D1C4' \
  --color='border:#77766F,gutter:#A6A394' \
  --color='info:#929187,prompt:#A6A394' \
  --color='pointer:#C4BFAE,marker:#A6A394'

# ==============================
# ohmyzsh
# ==============================

plugins=(
  git
  fzf-tab
)

source $ZSH/oh-my-zsh.sh

# ====================================
# Aliases
# =====================================

alias fzf="fzf -m"
alias ls="eza -1 --icons=always --oneline"
alias lsd="eza -lh1 --icons always"
alias lst="eza --icons never -T -L"
alias v="nvim"
alias lg="lazygit"

source <(fzf --zsh)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
