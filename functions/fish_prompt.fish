function fish_prompt
  # Cache exit status
  set -l last_status $status

  # Just calculate these once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end
  if not set -q __fish_prompt_char
    switch (id -u)
      case 0
        set -g __fish_prompt_char \u276f\u276f
      case '*'
        set -g __fish_prompt_char »   
      end
  end

  # Setup colors
  set -l normal (set_color normal)
  set -l cyan (set_color cyan)
  set -l yellow (set_color yellow)
  set -l bpurple (set_color -o purple)
  set -l bred (set_color -o red)
  set -l bgreen (set_color -o green)
  set -l bcyan (set_color -o cyan)
  set -l byellow (set_color -o yellow)
  set -l bblue (set_color -o blue)
  set -l bwhite (set_color -o white)

  # Configure __fish_git_prompt
  set -g __fish_git_prompt_show_informative_status true
  set -g __fish_git_prompt_showcolorhints true

  # Adds the name of a python virtual environment to the prompt
  if set -q VIRTUAL_ENV
    echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
  end

  # Color prompt char red for non-zero exit status
  set -l pcolor $bpurple
  if [ $last_status -ne 0 ]
    set pcolor $bred
  end

  # Top
  echo -n $bblue# $bred$USER$normal $bwhite(echo '@')$normal $bgreen$__fish_prompt_hostname$normal $bwhite(echo 'in')$normal $byellow(basename (prompt_pwd))$normal
  __fish_git_prompt

  echo

  # Bottom
  echo -n $pcolor$__fish_prompt_char $normal
end
