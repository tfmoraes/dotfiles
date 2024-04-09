if type -q exa
    alias ll "exa -l -g --icons"
    alias lla "ll -a"
end

if test -f $HOME/.bashrc.d/alias.sh
    source $HOME/.bashrc.d/alias.sh
end
