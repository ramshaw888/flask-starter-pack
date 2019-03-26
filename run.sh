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

function pip_compile {
  build
  docker run -v $(pwd):/root -it ${APP_NAME} bash -c 'pip install pip-tools && pip-compile'
}

case $1 in
  "pip-compile")
    pip_compile
    ;;
  "build")
    build
    ;;
  *)
    default
    ;;
esac
