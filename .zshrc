# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# If you come from bash you might have to change your $PATH.
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/opt/binutils/bin:$PATH"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="/opt/homebrew/opt/unzip/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/opt/python@3.10/bin:$PATH"
export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gnu-getopt/bin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gnu-indent/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/inetutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="${HOME}/.bin:$PATH"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Force yourself as the system's default user
DEFAULT_USER="moby.huang"

# Ignore permission issues while loading completion system
ZSH_DISABLE_COMPFIX=true

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM="${ZSH}/custom"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=()

source $ZSH/oh-my-zsh.sh

### User configuration
# export TERM="xterm-256color"

export MANPATH="/opt/homebrew/opt/coreutils/libexec/gnuman:$MANPATH"

export GOPATH="${HOME}/.go"
export PATH="$GOPATH/bin:$PATH"

export GROOVY_HOME="/opt/homebrew/opt/groovy/libexec"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
export ARCHFLAGS='-arch arm64'
export CFLAGS="-I/opt/homebrew/include -L/opt/homebrew/lib"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
source "${HOME}/.aliases"
source "${HOME}/.iterm2_shell_integration.zsh"

export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/bottles
export HOMEBREW_NO_AUTO_UPDATE=true
export BAT_THEME=TwoDark

# Source iTerm2 tab color functions and set the color on startup
# source "${HOME}/.iterm2-tab-color/functions.sh"
# it2-tab-color "$(openssl rand -hex 3)"

# eval "$(dircolors ${HOME}/.dir_colors)"
# eval "$(thefuck --alias)"
# eval "$(pyenv init -)"

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs command_execution_time)
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_VCS_HIDE_TAGS="true"
POWERLEVEL9K_STATUS_CROSS="true"
zinit load "romkatv/powerlevel10k"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'
zinit ice silent wait atload'_zsh_autosuggest_start'; zinit load zsh-users/zsh-autosuggestions

# Disable paste highlighting
zle_highlight+=(paste:none)
### Fix slowness of pastes with zsh-syntax-highlighting
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
### Fix slowness of pastes
zinit load zdharma/fast-syntax-highlighting

# AUTO_NOTIFY_IGNORE+=(docker gping man mpv ncdu ping sleep vi vim)
# zinit load MichaelAquilina/zsh-auto-notify

# zinit ice silent wait; zinit light gretzky/auto-color-ls

zinit ice as"program" pick"bin/git-dsf"
zinit light z-shell/zsh-diff-so-fancy

zinit light zpm-zsh/colorize
zinit light rutchkiwi/copyzshell
zinit light vladmyr/dotfiles-plugin
zinit light wfxr/forgit
zinit light diazod/git-prune
zinit load zdharma/history-search-multi-word
zinit light zlsun/solarized-man
zinit light valentinocossar/sublime
zinit light chrissicool/zsh-256color
zinit load hlissner/zsh-autopair
zinit load zsh-users/zsh-completions
zinit light vincentdnl/zsh-crypto-prices
zinit light joel-porquet/zsh-dircolors-solarized
zinit load zsh-users/zsh-history-substring-search
zinit light SukkaW/zsh-ipip
# zinit load paulmelnikow/zsh-startup-timer

zinit snippet OMZ::plugins/autojump/autojump.plugin.zsh

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
