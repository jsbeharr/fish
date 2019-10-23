# Moving between directories
alias .. "cd .."
alias ... "cd ../.."

# Making and removing directories
alias md "mkdir -p"
alias rd "rmdir"

# List directory contents
alias lsa "ls -lah"
alias l "ls -lah"
alias ll "ls -lh"
alias la "ls -lAh"
alias all "ls -R * | less"

# List all dot files
alias dfs "ls -A | grep \"^\.\""

# For FUN! :) ~~~~~~~~~~~~~~~~~
alias mapscii "telnet mapscii.me"
alias starii "telnet towel.blinkenlights.nl"

# Git Abbreviations
abbr -a gco git checkout
abbr -a gaa git add -A
abbr -a gcm git commit
abbr -a gst git status
abbr -a gpu git push
# Alias and Abbreviations for
# Linux and MacOS
switch (uname)
case Linux
  #  copy output to clipboard
  alias copy "xclip -selection clipboard"
  if type -q pacman
    abbr -a upg sudo pacman -Syyu
    abbr -a ins sudo pacman -S
    abbr -a rem sudo pacman -Rs
    abbr -a query sudo pacman -Ss
  else if type -q apt
    abbr -a upg sudo apt update
    abbr -a ins sudo apt install
    abbr -a rem sudo apt remove
    abbr -a query sudo apt search
  end
case Darwin
  alias copy "pbcopy <"
  abbr -a upd brew update
  abbr -a upg brew upgrade
  abbr -a ins brew install
  abbr -a rem brew uninstall
end

# Colored Man
set -xU LESS_TERMCAP_md (printf "\e[01;31m")
set -xU LESS_TERMCAP_me (printf "\e[0m")
set -xU LESS_TERMCAP_se (printf "\e[0m")
set -xU LESS_TERMCAP_so (printf "\e[01;44;33m")
set -xU LESS_TERMCAP_ue (printf "\e[0m")
set -xU LESS_TERMCAP_us (printf "\e[01;32m")

# andaconda shell integration
# source $HOME/.config/fish/conda.fish

# Sets up GPU Support for tensorflow
export LD_LIBRARY_PATH=/opt/cuda-9.0/lib64/
# Qt settings
export QT_SCALE_FACTOR=1
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_SCREEN_SCALE_FACTORS=2
# python virtual env wrapper
eval (python -m virtualfish auto_activation)

# GPG
set -gx GPG_TTY (tty)

# set editor and visual
if type -q nvim
  # Set vi command to open neovim if neovim is installed
  set -gx VISUAL nvim
  # set aliases for neovim
  alias vi "nvim"
  alias vim "nvim"
  alias vimdiff "nvim -d"
else
  # Otherwise set the editor to vim
  set -gx VISUAL vim
end
set -gx EDITOR $VISUAL

# Set default browser
if type -q brave
  set -gx BROWSER /usr/bin/brave
end

# clear history on terminal exit
function bye --on-process-exit %self
  builtin history clear
  echo Session history scrubbed. Goodbye
end
source /opt/ros/melodic/share/rosbash/rosfish
