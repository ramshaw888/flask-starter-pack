#/bin/bash

APP_NAME=${APP_NAME:="starter_pack"}

docker ps -a -q --filter name=${APP_NAME} | xargs -I {} sh -c 'docker stop {}; docker rm -f {}'

function default {
  docker build --tag ${APP_NAME} .
  docker run -it --publish 5200:5200 ${APP_NAME}
}

case $1 in
  "pip")
    docker build --tag ${APP_NAME} .
    docker run -it ${APP_NAME} cat Pipfile.lock > Pipfile.lock
    ;;
  *)
    default
    ;;
esac
