python << endpython
import vim
import os
import socket

HOME_SOCKET = os.path.join(os.path.expanduser('~'), '.ipython', 'IPYS')

def runner(content):
    s = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
    try:
        # make sure to chage the directory here
        s.connect(HOME_SOCKET)
        s.send(content)
        s.close()
    except:
        print "Error: could not connect to iPython server."

# --- Functions for running code in iPython --------------------------------- #

def run_current_line():
    runner(vim.current.line)

def run_selection():
    runner("\n".join(vim.current.range))

def run_buffer():
    runner("\n".join(vim.current.buffer))

# --- Clean up function

def remove_sockets():
    import os
    import sys
    os.remove(HOME_SOCKET)

endpython
