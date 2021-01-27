FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install wget gnupg -y

RUN wget -O - https://facebook.github.io/mcrouter/debrepo/bionic/PUBLIC.KEY | apt-key add

RUN echo 'deb https://facebook.github.io/mcrouter/debrepo/bionic bionic contrib' >> /etc/apt/sources.list

RUN apt-get update && apt-get install mcrouter -y

COPY ./config.json /etc/mcr-config.json

CMD ["mcrouter", "--config", "file:/etc/mcr-config.json", "-p", "5000"]
