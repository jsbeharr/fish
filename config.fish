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
alias dotfiles "ls -A | grep \"^\.\""

# Set vi command to open neovim if neovim is installed
alias vi "nvim"
alias vim "nvim"
alias vimdiff "nvim -d"

# For FUN! :) ~~~~~~~~~~~~~~~~~
alias mapscii "telnet mapscii.me"
alias starii "telnet towel.blinkenlights.nl"

# andaconda shell integration
# source $HOME/.config/fish/conda.fish

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

# clear history on terminal exit
function bye --on-process-exit %self
  builtin history clear
  echo Session history scrubbed.  Goodbye
end

# iterm shell integration
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
