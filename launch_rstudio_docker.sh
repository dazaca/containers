#!/bin/sh
# Copyright (c) 2022, David Zafra Cámara
# Runs RStudio Server container based on personalized image of rocker/verse.

# Will Remove all stopped containers
#docker container prune

# Will Remove all exited containers from previous linux sessions
sudo docker rm $(sudo docker ps --filter status=exited -q)

# Will log with Docker Hub account by reading the pwd from the txt file:

cat ~/Containers/2_docker_hub_pw.txt | sudo docker login --username dazaca --password-stdin

# Will run the container in the background with "-d" option:

sudo docker run -d -p 8787:8787 -e PASSWORD=toto 9537c15e4354
sleep 1 
firejail /usr/lib/firefox/firefox http://localhost:8787/


