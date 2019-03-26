#/bin/bash

APP_NAME=${APP_NAME:="starter_pack"}

docker ps -a -q --filter name=${APP_NAME} | xargs -I {} sh -c 'docker stop {}; docker rm -f {}'

function build {
  docker build --tag ${APP_NAME} .
}

function default {
  build
  docker run -it --publish 5200:5200 ${APP_NAME}
}

case $1 in
  "build")
    build
    ;;
  *)
    default
    ;;
esac
