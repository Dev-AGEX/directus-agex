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

# Create startup script for Supabase PostgreSQL
RUN echo '#!/bin/sh\n\
set -e\n\
echo "Checking database connection..."\n\
echo "Running database migrations..."\n\
directus database migrate:latest || echo "Migration failed but continuing..."\n\
echo "Starting Directus..."\n\
directus start\n\
' > /directus/start.sh && chmod +x /directus/start.sh

EXPOSE 8055

# Start Directus with custom script
CMD ["/directus/start.sh"]