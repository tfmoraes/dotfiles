export PATH=/usr/local/bin:$PATH:$HOME/bin:$HOME/.local/bin/

if [ -d $HOME/.cargo/bin ]; then
    export PATH=$PATH:~/.cargo/bin/
fi
