FROM ubuntu:20.04

# Install required packages
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    python3-venv \
    git

# Create and activate virtual environment
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install PyYAML within the virtual environment
RUN pip install PyYAML

# Copy files to the virtual machine
COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]