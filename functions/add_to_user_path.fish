function add_to_user_path
  for path in $argv
    if not contains $path $fish_user_paths
      set --universal fish_user_paths $path $fish_user_paths
    end
  end
end

