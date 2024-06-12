FROM ubuntu:20.04

# Set DEBIAN_FRONTEND to noninteractive to avoid prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    python3-venv \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create and activate virtual environment
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install PyYAML within the virtual environment
RUN /opt/venv/bin/pip install PyYAML

# Copy files to the virtual machine
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Reset DEBIAN_FRONTEND back to original
ENV DEBIAN_FRONTEND=dialog
