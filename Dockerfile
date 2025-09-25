# Base image
FROM python:3.11-slim

# Install dependencies
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y fortune-mod cowsay netcat-openbsd && \
    ln -sf /usr/games/fortune /usr/local/bin/fortune && \
    ln -sf /usr/games/cowsay /usr/local/bin/cowsay && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy the wisecow.sh script
COPY wisecow.sh /app/

# Make the script executable
RUN chmod +x /app/wisecow.sh

# Expose port
EXPOSE 4499

# Run the script
CMD ["./wisecow.sh"]
