#!/bin/bash

system=rocky_8
image=kubeasz-sys-pkg:dev
docker_name=kubeasz-sys-pkg-dev

if [ -n "$1" ]; then
    system=$1
fi

function docker_build() {
    docker build -t $image -f Dockerfile $system
}

function docker_run() {
    docker run --rm --name $docker_name -it $image
}

function copy_file() {
    docker cp $docker_name:/packages/ .
}

function docker_stop() {
    docker stop $docker_name
}

docker_build
docker_run
copy_file
docker_stop
