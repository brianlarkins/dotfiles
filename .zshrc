# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/brian/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(aliases colorize colored-man-pages command-not-found common-aliases 
  copyfile copypath git gh tmux iterm2)

zstyle :omz:plugins:iterm2 shell-integration yes

source $ZSH/oh-my-zsh.sh

# override agnosters super long prompt with a shorter one
prompt_dir() {
  prompt_segment blue $CURRENT_FG '%3~'
}

# User configuration
#
autoload zcalc
autoload zmv

alias python="python3"
bindkey '^[^M' self-insert-unmeta
unalias cp
unalias rm

alias vi='nvim'
# Dotfiles bare repo. A function rather than an alias so that zsh completion
# can be pointed at the right repo explicitly (see _gconfig below), and so it
# also works in scripts and subshells, where aliases are not expanded.
gconfig() {
  git --git-dir="$HOME/.cfg" --work-tree="$HOME" "$@"
}
# Complete gconfig exactly like git, but resolve refs and paths against the
# dotfiles repo. `local -x` scopes these to this one completion call, so plain
# `git` in every other repo is unaffected.
#
# This is needed because _git only parameter-expands --git-dir via ${~...},
# which does globbing, not parameter expansion -- so a $HOME in an alias
# reaches it as a literal string and every lookup fails silently.
_gconfig() {
  local -x GIT_DIR="$HOME/.cfg" GIT_WORK_TREE="$HOME"
  # _git dispatches on $service: if it isn't exactly "git" it falls through to
  # `_call_function ret _$service`, which calls this function again and blows
  # the FUNCNEST limit. Setting it here selects _git's real git branch.
  local service=git
  _git
}
compdef _gconfig gconfig

# need to use zsh glob options to disable approximate matching for this alias
alias ct='rm -f *~(N) *.aux(N) *.fdb_latexmk(N) *.fls(N) *.synctex.gz(N) *.log(N) *.out(N) *.toc(N)' 

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
  export VISUAL='nvim'
else
  export EDITOR='nvim'
  export VISUAL='nvim'
fi

#export FCEDIT='emacs'

if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  PATH=/opt/homebrew/opt/ruby/bin:$PATH
fi

PATH=$PATH:$HOME/bin:$HOME/opt/bin:$HOME/.local/bin:/usr/local/smlnj/bin:$HOME/Library/Python/3.9/bin:.
PATH=/opt/homebrew/opt/openjdk/bin:$PATH

# added by compiler tools installer
COMP362TOOLS="$HOME/teaching/compilers/grading/sp24/comp362-sp24-lab3-submissions/comp362-tools"
COMP362LAB=lab6
PATH=$PATH:$COMP362TOOLS/bin
CLASSPATH=.:..:$COMP362TOOLS/../comp362-$COMP362LAB:$COMP362TOOLS/classes/jlex.jar:$COMP362TOOLS/classes/java_cup.jar:$COMP362TOOLS/classes/$COMP362LAB.jar
export COMP362TOOLS COMP362LAB PATH CLASSPATH
# end compilers additions

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

