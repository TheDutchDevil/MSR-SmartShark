# MSR-SmartShark

This repository contains docker images that can be used to host the smartshark dataset. You can either opt
for the small or for the full dataset. The full dataset probably requires ~200 to ~300GB, while the small 
dataset should require 10% of that.

The dataset is courtesy of Trautsch et al. ((see)[https://arxiv.org/abs/2102.11540]) and the docker images
in this repo use at least version 2.1 of the dataset. Making these image suitable if you quickly want to
get up and running for the MSR Mining Challenge 2021 ((see)[https://conf.researchr.org/track/msr-2022/msr-2022-mining-challenge#Call-for-Mining-Challenge-Papers]). 

## Dataset images

To run the dataset images you should first build the docker images (This does not yet download the dataset).
After building you should run the docker images using the following command:

`docker run -it --rm -p 27017:27017 -v $PWD:/data:/data/db <TAG_NAME>`

This command mounts the data directory of the mongoDB image outside the container itself, such that the
dataset is preserved after you kill the container. While running this container for the first time 
it will download its version of the SmartShark dataset, unpack and restore it. After that, if you rerun
the container using the same command it will spot that the dataset has already been downloaded, and 
just start up the mongoDB container. 

Therefore, you should only clone this repository on a drive that is large enough to store the SmartShark
version you want to run. Alternatively, you can modify the volume part of the run command `-v $PWD:/data/db'
to store the data of the container on another drive. 

## Analyis images

TODO: Describe how one can use the analysis images