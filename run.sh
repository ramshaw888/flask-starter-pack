#/bin/bash

function default {
  docker build --tag starter-pack .
  docker network create starter-pack-local
  docker run -it --network ramshaw_network --publish 5100:5100 starter-pack bash
}

case $1 in
  "pip")
    docker build --tag starter-pack .
    docker run -it starter-pack cat Pipfile.lock > Pipfile.lock
    ;;
  *)
    default
    ;;
esac
