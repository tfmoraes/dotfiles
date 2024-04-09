if test -d /usr/local/cuda
    set -x LD_LIBRARY_PATH "$LD_LIBRARY_PATH:/usr/local/cuda/lib64/"
    pathadd /usr/local/cuda/bin
end
