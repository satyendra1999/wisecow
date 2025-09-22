# Base image
FROM python:3.11-slim

# Install required packages
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y fortune-mod cowsay netcat-openbsd && \
    # Create symbolic links so script finds binaries
    ln -sf /usr/games/fortune /usr/local/bin/fortune && \
    ln -sf /usr/games/cowsay /usr/local/bin/cowsay && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy the wisecow folder from host to container
COPY wisecow /app

# Make the wisecow.sh script executable
RUN chmod +x /app/wisecow.sh

# Expose port
EXPOSE 4499

# Run the Wisecow script
CMD ["/bin/bash", "/app/wisecow.sh"]
