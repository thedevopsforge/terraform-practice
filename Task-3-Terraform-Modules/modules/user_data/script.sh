#!/bin/bash
dnf update -y
dnf install docker -y
systemctl start docker
docker run -d -p 80:${container_port} ${docker_image}
