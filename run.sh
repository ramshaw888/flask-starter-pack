#/bin/bash

function default {
  docker build --tag starter-pack .
  docker network create starter-pack-local
  docker run -it --network ramshaw_network --publish 5100:5100 starter-pack
}

case $1 in
  "pip")
    echo "todo"
    ;;
  *)
    default
    ;;
esac
