FROM ubuntu:18.04

RUN apt update && apt install curl tar -y &&\
    curl -L https://www.opscode.com/chef/install.sh | bash -s -- -P chefdk &&\
    echo 'eval "$(chef shell-init bash)"' >> ~/.bashrc

ENV DOCKER_CHANNEL edge
ENV DOCKER_VERSION 18.02.0-ce

RUN set -ex; \
	  curl -fL -o docker.tgz "https://download.docker.com/linux/static/${DOCKER_CHANNEL}/x86_64/docker-${DOCKER_VERSION}.tgz" &&\
	  tar --extract --file docker.tgz --strip-components 1 --directory /usr/local/bin/ &&\
   	rm docker.tgz &&\
  	dockerd -v &&\
	  docker -v &&\
		alias dokken="KITCHEN_LOCAL_YAML=.kitchen.dokken.yml kitchen"

COPY modprobe.sh /usr/local/bin/modprobe

LABEL org.label-schema.name="kitchen-ci" \
      org.label-schema.vendor="Damacus.io" \
      org.label-schema.version="0.2"

