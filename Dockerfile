FROM node:22-bullseye-slim

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

# Copy package files
COPY package.json package-lock.json ./

# Install dependencies without rebuilding
RUN npm ci

# Copy project files
COPY . .

# Create uploads directory
RUN mkdir -p uploads && chmod 777 uploads

EXPOSE 8055

CMD ["npm", "start"]