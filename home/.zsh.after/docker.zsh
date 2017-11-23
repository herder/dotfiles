docker-machine env default >/dev/null || docker-machine restart default

eval "$(docker-machine env default)"
