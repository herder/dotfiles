if command -v minikube >/dev/null 2>&1 ; then
  echo "configuring for local dev with minikube"
  source <(minikube completion zsh)
  eval $(minikube docker-env)
fi
