FROM ubuntu:16.10
MAINTAINER dan.webb@damacus.io

LABEL org.label-schema.name="kitchen-ci" \
      org.label-schema.vendor="Damacus.io" \
      org.label-schema.version="0.1" 

RUN apt-get update && apt-get upgrade -y
RUN apt-get install curl -y
RUN curl -L https://www.opscode.com/chef/install.sh | bash -s -- -P chefdk
RUN echo 'eval "$(chef shell-init bash)"' >> ~/.bashrc
