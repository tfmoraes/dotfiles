## Try to autocorrect commands.
setopt correct

# Use cool globbing options.
setopt extended_glob

# Expand stuff, perform substitutions and so on in the prompt.
setopt prompt_subst

# No beeps.
setopt no_beep

# When using ! commands, print the command instead of executing it.
setopt hist_verify

# Save timestamp and duration for each command in the history.
setopt extended_history

# Don't add command to the history if they start with a space.
setopt hist_ignore_space

# Don't overwrite history, append to it.
setopt append_history

# Do not enter command lines into the history list if they are duplicates of the
# previous event, and remove older duplicates of the command from the history.
setopt hist_ignore_dups
setopt hist_ignore_all_dups

# Reduce whitespace in history commands.
setopt hist_reduce_blanks

# Expire duplicates first when the history grows too much.
setopt hist_expire_dups_first

# When searching for history entries in the line editor, do not display
# duplicates of a line previously found, even if the duplicates are not
# contiguous.
setopt hist_find_no_dups
