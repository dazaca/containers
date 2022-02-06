#!/bin/sh
# Copyright (c) 2022, David Zafra Cámara
# Runs RStudio Server container based on personalized image of rocker/cuda:

# https://hub.docker.com/r/rocker/cuda


# Will Remove all stopped containers
#docker container prune

# Will Remove all exited containers from previous linux sessions
sudo docker rm $(sudo docker ps --filter status=exited -q)

# Will log with Docker Hub account by reading the pwd from the txt file:

cat ~/Containers/2_docker_hub_pw.txt | sudo docker login --username dazaca --password-stdin



#######################################
# https://hub.docker.com/r/rocker/cuda


########## Just R:

#docker run --rm -ti rocker/ml R

# Machines with nvidia-docker and GPU support:
# docker run --gpus all --rm -ti rocker/ml R

########## RStudio:

# Machines with nvidia-docker and GPU support:
#docker run --gpus all -e PASSWORD=mu -p 8787:8787 rocker/ml

# Will run the container in the background with "-d" option:
#sudo docker run -d -p 8787:8787 -e PASSWORD=toto 8ae0c09f87a2
#sudo docker run -d -e PASSWORD=toto -p 8787:8787 rocker/ml
#sudo docker run -d -p 8787:8787 -e PASSWORD=toto 96bf9452de2a 
#sudo docker run -d -p 8787:8787 -e PASSWORD=toto rocker/ml-verse:latest 
sudo docker run -d -p 8787:8787 -e PASSWORD=toto dazaca/rstudio:2_keras_tensorflow 



sleep 1
firejail /usr/lib/firefox/firefox http://localhost:8787/
