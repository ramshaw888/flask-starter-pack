#/bin/bash

APP_NAME=${APP_NAME:="starter_pack"}
MANAGEMENT_APP_NAME="$APP_NAME"_management

docker ps -a -q --filter name=${APP_NAME} | xargs -I {} sh -c 'docker stop {}; docker rm -f {}'

function build {
  docker build --tag ${APP_NAME} .
}

function build_management {
  docker build -f Dockerfile.management --tag ${MANAGEMENT_APP_NAME} .
}

function default {
  build
  docker run -it \
      --env "APP_GUNICORN_BIND=0:5200" \
      --publish 5200:5200 \
      ${APP_NAME}
}

function lint {
  build_management
  docker run -v $(pwd):/root -it ${MANAGEMENT_APP_NAME} flake8
}

function pip_compile {
  build_management
  docker run -v $(pwd):/root -it ${MANAGEMENT_APP_NAME} pip-compile
}

case $1 in
  "pip-compile")
    pip_compile
    ;;
  "lint")
    lint
    ;;
  "build")
    build
    ;;
  *)
    default
    ;;
esac
