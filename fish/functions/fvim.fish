function fvim --description "Fuzzy search to open in sublime"
  if fzf > /tmp/fzf.result
    nvim (cat /tmp/fzf.result)
  end
end
