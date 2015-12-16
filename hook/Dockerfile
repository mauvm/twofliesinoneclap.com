FROM ubuntu:14.04
MAINTAINER Maurits van Mastrigt <maurits@nerdieworks.nl>

ENV HOOK_PORT 9001

RUN apt-get update && apt-get install -y git-core

WORKDIR /data
CMD ["/data/hook/run.sh"]
