if type gcloud >/dev/null 2>&1; then
  GCLOUD_HOME="/usr/share/google-cloud-sdk"
  # source '$GCLOUD_HOME/path.zsh.inc'
  source "$GCLOUD_HOME/completion.zsh.inc"
fi


