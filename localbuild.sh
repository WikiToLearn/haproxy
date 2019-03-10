#!/bin/bash
docker build -t wikitolearn/haproxy:$(cat new_docker_image_version) .
