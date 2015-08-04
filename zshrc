source ~/antigen.zsh
source ~/.zlib/exports.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle virtualenvwrapper

antigen bundle zsh-users/zsh-completions src

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# History search
antigen bundle zsh-users/zsh-history-substring-search

# Autoenv
# antigen bundle Tarrasch/zsh-autoenv

# Load the theme.
antigen theme my_avit

# Tell antigen that you're done.
antigen apply

source ~/.zlib/options.zsh
source ~/.zlib/keybindings.zsh
source ~/.zlib/path.zsh
source ~/.zlib/functions.zsh
source ~/.zlib/aliases.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f ~/.iterm2_shell_integration.zsh ] && source ~/.iterm2_shell_integration.zsh


