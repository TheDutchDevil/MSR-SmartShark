# MSR-SmartShark

This repository contains docker images that can be used to host the 2.1 version of the smartshark dataset. 
You can either opt for the small or for the full dataset. The full dataset probably requires ~500 to ~600GB, while the small 
dataset should require 5% of that.

The dataset is courtesy of Trautsch et al. ([see](https://arxiv.org/abs/2102.11540)) and the docker images
in this repo use at least version 2.1 of the dataset. Making these image suitable if you quickly want to
get up and running for the MSR Mining Challenge 2021 ([see](https://conf.researchr.org/track/msr-2022/msr-2022-mining-challenge#Call-for-Mining-Challenge-Papers)). 

## Dataset images

To run the dataset images you should first build the docker images (This does not yet download the dataset).
After building you should run the docker images using the following command:

`docker run -it --rm -p 27017:27017 -v $PWD/data:/data/db <TAG_NAME>`

This command mounts the data directory of the mongoDB image outside the container itself, such that the
dataset is preserved after you kill the container. While running this container for the first time 
it will download its version of the SmartShark dataset, unpack and restore it. After that, if you rerun
the container using the same command it will spot that the dataset has already been downloaded, and 
just start up the mongoDB container. 

Therefore, you should only clone this repository on a drive that is large enough to store the SmartShark
version you want to run. Alternatively, you can modify the volume part of the run command `-v $PWD:/data/db'
to store the data of the container on another drive. 

## Analyis image

If you want to analyse the data you can use the analysis image, you can build the container in the 
analysis folder by cd'ing to the analysis folder and using the command:

`docker build -t <TAG_NAME> .`

After the image has been built you can then run a container using the command:

`docker run -it --rm -p 8888:8888 -v $PWD/notebooks:/home/jovyan/work <TAG_NAME>`

In your terminal you can see the url that you need to connect to jupyter notebook instance.

As a default this analysis image has one cell with one notebook, this cell counts the commits for a 
project in the dataset. You can run this cell to verify that everything works. 

One thing you might need to change is the IP address that you use within the analysis image 
to connect to the smart shark dataset. If you run both the mongodb and the analysis image on the
same machine you should use the following set of commands:

`docker ps`

This gives you the container id of the container running the mongodb image. 

`docker inspect <CONTAINER_ID>`

This returns all information about the running container, within the output of this command 
there is a key `"IPAddress"`. The IP address listed in this output is the IP adress that
you should use within the analysis container to connect to the mongoDB database. 

When cloning this repository it will be `172.17.0.2`.