if command -v docker-machine >/dev/null 2>&1 ; then 
  docker-machine status >/dev/null || docker-machine create --driver=xhyve default

  docker-machine env default >/dev/null || docker-machine restart default

  eval "$(docker-machine env default)"
  export LOCALMACHINE=$(docker-machine ip default)
fi
