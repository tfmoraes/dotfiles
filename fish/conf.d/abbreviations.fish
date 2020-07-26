set -gx os (uname)
switch $os
case Darwin
  ################
  # macOS specific abbreviations
  ##

  ####
  # macOS Debugging
  ##
  abbr -ag sip-status 'csrutil status'
  abbr -ag mac-print-sip-status 'csrutil status'

  # setup an alias for quicklook from the terminal in macOS
  abbr -ag ql 'qlmanage -p'
  # update location DB
  # NOTE: changed abbr to `mac-updatedb` because of homebrew installed
  #...`findutils` which provides the `updatedb` bin.
  abbr -ag mac-updatedb 'sudo /usr/libexec/locate.updatedb'
  abbr -ag mac-hide-files 'mac_toggle_hidden_files'
  abbr -ag mac-show-files 'mac_toggle_hidden_files'
  abbr -ag mac-toggle-hidden-files 'mac_toggle_hidden_files'
  abbr -ag mac-toggle-desktop-icons 'mac_toggle_desktop_icons.sh'
  abbr -ag mac-print-users 'mac_lsusers'

  ################
  # launchd / launchctl
  ##
  abbr -ag lc 'launchctl'
  
  ################
  # homebrew specifc abbreviations
  ##
  if type -q brew
    # working with brew src and formula
    abbr -ag cd-brew-src "cd (brew --prefix)/Homebrew/Library/Taps/homebrew/homebrew-core"
    abbr -ag cdbrewsrc "cd (brew --prefix)/Homebrew/Library/Taps/homebrew/homebrew-core"

    # youtube-dl
    abbr -ag you "youtube-dl"
    abbr -a -g youdl 'youtube-dl --output "%(title)s.%(ext)s"'

    ###
    # brew postgresql
    abbr -ag pg-start "launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
    abbr -ag pg-stop "launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"

    ###
    # brew redis
    abbr -ag redis-start "launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist"
    abbr -ag redis-stop "launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.redis.plist"

    ###
    # brew OpenSSH built with LibreSSL
    abbr -ag ssh-start "sudo launchctl load /Library/LaunchDaemons/com.chrisrjones.sshd.plist"
    abbr -ag ssh-stop "sudo launchctl unload /Library/LaunchDaemons/com.chrisrjones.sshd.plist"

    ###
    # brew MongoDB
    abbr -ag mongod-start "launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist"
    abbr -ag mongod-stop "launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist"
end

case Linux
  ###############################
  # sytemd BS 🙄
  abbr -ag sc systemctl
  alias running_services='systemctl list-units  --type=service  --state=running'

  ###############################
  # make copy / paste a little bit easier for pengiuns 🐧
  abbr -ag pbcopy "xclip -selection clipboard"
  abbr -ag pbpaste "xclip -selection clipboard -o"

  ###############################
  # Linuxbrew
  if type -q brew
    # working with brew src and formula
    abbr -ag cd-brew-src "cd (brew --prefix)/Homebrew/Library/Taps/homebrew/homebrew-core"

    # youtube-dl
    abbr -ag you "youtube-dl"
  end
end

################
# Add special 🚌 aliases if certain binaries are found.
