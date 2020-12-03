# Path to your oh-my-zsh installation.
export ZSH="/Users/malvarez/.oh-my-zsh"

export CLICOLOR=1
export TERM="xterm-256color"


ZSH_DISABLE_COMPFIX=true


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='powerline'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=( node_version nvm dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(todo)
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_VCS_HIDE_TAGS=false
POWERLEVEL9K_SHOW_CHANGESET=false
POWERLEVEL9K_VCS_GIT_HOOKS=(vcs-detect-changes git-untracked git-aheadbehind git-stash git-remotebranch git-tagname)
OWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\uE0B0'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\uE0B2'
VCS_TAG_ICON='\u263F'
VCS_GIT_ICON='Git'
#POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_last
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
plugins=(
   git
   zsh-syntax-highlighting
   z)
   # zsh-autosuggestions
   source $ZSH/oh-my-zsh.sh

#=====================ALIAS=====================================================
#System
alias zshconfigc="code ~/.zshrc"
alias zshconfig="nvim ~/.zshrc"
alias vimconfigc="code ~/.vimrc"
alias vimconfig="nvim ~/.config/nvim/init.vim "
alias vimsnippets="nvim /Users/malvarez/.config/coc/ultisnips"
alias vimsnippetsc="code /Users/malvarez/.config/coc/ultisnips"
alias hyperconfig="nvim ~/.hyper.js"
alias alacrityconfig="nvim ~/.alacritty.yml"
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias dockSpace=' defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile"}'; killall Dock'
alias reload="source ~/.zshrc"
alias disableGate='sudo spctl --master-disable'
alias enableGate='sudo spctl --master-enable'
alias statusGate='spctl --status'
#Git
alias gtags="git log --tags --oneline --decorate --simplify-by-decoration"
alias dtags="git push origin master :refs/tags/"
alias graph="git log --tags --pretty --decorate --graph --all"
alias geturl="git remote get-url origin"
#Apps
alias xcode='open -a /Applications/Xcode.app'
alias runMongo='mongod --config /usr/local/etc/mongod.conf'
alias pserve='python -m SimpleHTTPServer 8000'
alias weather='curl http://wttr.in/'
alias lsf='ls | fzf'
alias nsf='nvim $(fzf)'
alias vsf='code $(fzf)'
#CELLS
#polymer
alias rep="open https://globaldevtools.bbva.com/bitbucket/"
alias _bl="ls ~/.local/share/bower/links"
alias _rbl="rm -rf ~/.local/share/bower/links"
alias ccover="open -a 'Google Chrome' ./coverage-reports/lcov-report/index.html"
alias cserve="cells component:serve"
alias ctest="cells component:test"
alias clint="cells component:lint"
alias iospod="pod deintegrate && pod repo-art update cells-native-cocoapods && pod repo-art update security-sdk-mobile-native-cocoapods && pod repo-art update gl-glomo-cocoapods & pod update"
#lit element
alias lserve="cells lit-component:serve"
alias ltestw="cells lit-component:test:watch"
alias ltest='cells lit-component:test'
alias llint="cells component:lint"
alias git-pr='f(){ git fetch origin refs/pull-requests/"$1"/from:"$2"; git checkout "$2";  unset -f f; }; f'
#Docker
alias rdocker="docker rm -fv \`docker ps -aq\`"
#Vim
alias v="nvim"
alias v.="nvim ."
vv() {
  if ["${1}" === '']; then 
    nvim
    exit 1;
  fi
   nvim ${1}
}

#FUNCTIONS
#Install lit element bbva ui
iui() {
   npm install --save  @bbva-web-components/${1}
}

tr() {
   tree -L ${1-1}
}

fetch() {
   git fetch origin refs/pull-requests/${1}/from:${2}
}

server() {
   cells app:serve -b develop -c $1/web-dev.js
}

reborn () {
   rm -rf components
   bower cache clean
   until bower i -F; do
   echo error installing components. Error code: ${$?}
   sleep 3
   done
}
export EDITOR="nvim"
export BASH="/usr/local/bin"
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
