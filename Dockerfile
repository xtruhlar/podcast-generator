FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git

RUN pip3 install PyYAML

# Copy files to virtual machine
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Entrypoint of project
ENTRYPOINT [ "/entrypoint.sh" ]