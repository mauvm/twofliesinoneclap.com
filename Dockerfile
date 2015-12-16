FROM ubuntu:14.04
MAINTAINER Maurits van Mastrigt <maurits@nerdieworks.nl>

RUN apt-get update && apt-get install -y curl

ENV HUGO_VERSION 0.15
RUN cd /tmp && \
	curl -L -O https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_linux_386.tar.gz && \
	tar xvf hugo_${HUGO_VERSION}_linux_386.tar.gz && \
	cp hugo_${HUGO_VERSION}_linux_386/hugo_${HUGO_VERSION}_linux_386 /hugo

EXPOSE 80
WORKDIR /www
ENTRYPOINT ["/hugo"]
