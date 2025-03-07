FROM node:22-alpine

WORKDIR /directus

# Install dependencies
RUN apk add --no-cache \
    python3 \
    build-base \
    g++ \
    cairo-dev \
    jpeg-dev \
    pango-dev \
    giflib-dev

# Copy package files
COPY package.json package-lock.json ./

# Install dependencies
RUN npm ci

# Copy project files
COPY . .

# Create uploads directory with proper permissions
RUN mkdir -p uploads && chmod 777 uploads

# Expose port
EXPOSE 8055

# Start Directus
CMD ["npm", "start"]