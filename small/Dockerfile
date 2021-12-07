FROM mongo:5

RUN apt-get update && apt-get install wget dos2unix

ENV MONGO_INITDB_ROOT_USERNAME=admin-shark

ENV MONGO_INITDB_ROOT_PASSWORD=msr2021shark

COPY setup.sh ./docker-entrypoint-initdb.d

RUN dos2unix ./docker-entrypoint-initdb.d/setup.sh
