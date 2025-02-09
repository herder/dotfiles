if type minikube >/dev/null 2>&1 ; then
  minikube profile >/dev/null 2>&1 || minikube start --memory=8192 --cpus=6 --disk-size=50g 
  eval $(minikube docker-env)
  source <(minikube completion zsh)
fi
