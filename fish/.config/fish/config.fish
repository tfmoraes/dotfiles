set fish_greeting "" # disable default fish greeting

#if test -d $HOME/.nix-profile/etc/profile.d/
#    bass source ~/.nix-profile/etc/profile.d/nix{,-daemon}.sh
#end
test -e /Users/thiago/.iterm2_shell_integration.fish ; and source /Users/thiago/.iterm2_shell_integration.fish ; or true

# if status is-interactive
#   atuin init fish --disable-up-arrow | source
# end
