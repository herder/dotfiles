docker-machine env default >/dev/null || docker-machine restart default

eval "$(docker-machine env default)"
export LOCALMACHINE=$(docker-machine ip default)
