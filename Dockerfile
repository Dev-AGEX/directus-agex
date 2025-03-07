FROM node:18-bullseye-slim

WORKDIR /directus

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    build-essential \
    libcairo2-dev \
    libpango1.0-dev \
    libjpeg-dev \
    libgif-dev \
    librsvg2-dev \
    libvips-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Directus globally
RUN npm install -g directus@10.8.3

# Copy configuration files
COPY .env ./
COPY package.json ./

# Create uploads directory
RUN mkdir -p uploads && chmod 777 uploads

# Create extensions directory
RUN mkdir -p extensions && chmod 777 extensions

EXPOSE 8055

# Start Directus
CMD ["directus", "start"]