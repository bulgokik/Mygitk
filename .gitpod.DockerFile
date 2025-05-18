# Use the official Ubuntu 24.04 LTS image
FROM ubuntu:24.10

# Update packages and install basic tools
RUN sudo apt-get update && \
    sudo apt-get upgrade -y && \
    sudo apt-get install -y \
        curl \
        wget \
        git \
        build-essential \
        bc \
        flex \
        bison \
        software-properties-common \
    && sudo rm -rf /var/lib/apt/lists/*

# (Optional) Add future 24.10 repositories (use with caution)
# RUN echo "deb http://archive.ubuntu.com/ubuntu/ oracular main restricted" >> /etc/apt/sources.list

# Install your application dependencies
# Example: Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
   sudo apt-get install -y nodejs

# Set environment variables
ENV NODE_ENV=production

# Copy your application files
COPY . /app
WORKDIR /app


