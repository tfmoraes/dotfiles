set -gx os (uname)
switch $os
# case Darwin
# # macOS specific abbreviations
# end
case Linux
alias running_services='systemctl list-units  --type=service  --state=running'
# make copy / paste a little bit easier for pengiuns 🐧
abbr -ag pbcopy "xclip -selection clipboard"
abbr -ag pbpaste "xclip -selection clipboard -o"
end
set -U fish_initialized
