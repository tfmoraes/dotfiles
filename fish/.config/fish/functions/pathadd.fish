function pathadd
    contains -- $argv $fish_user_paths
       or set -U fish_user_paths $fish_user_paths $argv
end

#function pathadd -a dir
#  if test -d $dir
#    set -gx PATH $dir $PATH
#  end 
#end
