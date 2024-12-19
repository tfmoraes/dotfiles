set fish_greeting "" # disable default fish greeting

# test -e /usr/share/fish/config.fish ; and source /usr/share/fish/config.fish; or true

#if test -d $HOME/.nix-profile/etc/profile.d/
#    bass source ~/.nix-profile/etc/profile.d/nix{,-daemon}.sh
#end
test -e /Users/thiago/.iterm2_shell_integration.fish; and source /Users/thiago/.iterm2_shell_integration.fish; or true

# if status is-interactive
#   atuin init fish --disable-up-arrow | source
# end

if set -q GHOSTTY_RESOURCES_DIR
    source "$GHOSTTY_RESOURCES_DIR/shell-integration/fish/vendor_conf.d/ghostty-shell-integration.fish"
    set --append fish_complete_path "$GHOSTTY_RESOURCES_DIR/../fish/vendor_completions.d"
end
