function killf
  if ps -ef | sed 1d | fzf -m | awk '{print $2}' > /tmp/fzf.result
    kill -9 (cat /tmp/fzf.result)
  end
end
