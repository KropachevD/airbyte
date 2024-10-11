# Use an official Docker image with bash support
FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    docker.io \
    docker-compose \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /usr/src/app

# Copy the Airbyte run script (your script)
COPY run-ab-platform.sh .

# Make the script executable
RUN chmod +x run-ab-platform.sh

# Expose necessary ports for Airbyte (Web UI, APIs)
EXPOSE 8000 8001

# Set default command to run your Airbyte script
CMD ["./run-ab-platform.sh"]

