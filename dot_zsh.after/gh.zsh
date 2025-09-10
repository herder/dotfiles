if (type gh >/dev/null ); then 
  eval "$(gh completion -s zsh)"
  gh worktree >/dev/null 2>&1 || gh extension install brooke-hamilton/gh-pr-worktree
  eval "$(gh worktree completion zsh)"
fi
