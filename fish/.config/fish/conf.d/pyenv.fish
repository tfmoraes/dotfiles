if type -q pyenv
    set -Ux PYENV_ROOT $HOME/.pyenv
    set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
    status is-interactive; and pyenv init --path | source
    pyenv init - | source
end
