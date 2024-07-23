FROM python:3.10-slim

# Install git and other dependencies
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev

# Install PyYAML using pip
RUN pip install --no-cache-dir PyYAML

# Copy the Python script
COPY feed.py /usr/bin/feed.py

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
