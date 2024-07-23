FROM ubuntu:latest

# Install Python, pip, git, and required dependencies for PyYAML
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev

# Install PyYAML using pip
RUN python3 -m pip install --no-cache-dir PyYAML

# Copy the Python script
COPY feed.py /usr/bin/feed.py

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
