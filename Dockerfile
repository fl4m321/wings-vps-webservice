# Use an official Ubuntu image
FROM ubuntu:20.04

# Install dependencies and required software
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    gnupg \
    lsb-release \
    sudo \
    apt-transport-https \
    ca-certificates \
    curl \
    unzip \
    bash \
    net-tools \
    python3 \
    python3-pip \
    && apt-get clean

# Install Docker (for container management in VPS)
RUN curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh

# Install Pterodactyl Wings dependencies
RUN apt-get install -y libmariadb-dev-compat libmariadb-dev

# Install Node.js (for the web console)
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs

# Set the working directory
WORKDIR /app

# Install dependencies for your web console app (e.g. using express or socket.io for console communication)
COPY . .

# Install web console dependencies (you can replace this with your web app's dependencies)
RUN npm install

# Expose ports for both Wings and the web service console
EXPOSE 8080 3000

# Run the web service and Wings
CMD ["sh", "-c", "node server.js & wings start"]
