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
abbr -a -g gco git checkout
abbr -a -g gaa git add -A
abbr -a -g gcm git commit
abbr -a -g gst git status
abbr -a -g gpu git push
# Alias and Abbreviations for
# Linux and MacOS
switch (uname)
case Linux
  # Lock the screen on gnome
  alias lock "dbus-send --type=method_call --dest=org.gnome.ScreenSaver /org/gnome/ScreenSaver org.gnome.ScreenSaver.Lock"
  # list copy output to clipboard
  alias copy "xclip -selection clipboard"
  abbr -a -g upg sudo pacman -Syyu
  abbr -a -g ins sudo pacman -S
  abbr -a -g rem sudo pacman -Rs
case Darwin
  function copy 
    cat $argv | pbcopy
  end
  abbr -a -g upg brew update
  abbr -a -g ins brew install
  abbr -a -g rem brew uninstall
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
