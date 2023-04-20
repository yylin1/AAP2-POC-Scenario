#!/bin/bash

echo ' Create pacman service with podman'

podman run -itd --name pacman -p 8001:8080 docker.io/georgechiu/pacman

echo 'Check podman status'

podman ps

echo 'Use http://<HOST_IP>:8001/ to check service'


