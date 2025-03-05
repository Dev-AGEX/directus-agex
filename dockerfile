FROM directus/directus:latest

WORKDIR /app

# Copy package files first for better caching
COPY package*.json ./

# Install dependencies
RUN npm install --omit=dev

# Copy configuration files
COPY .env ./
COPY . ./

# Set environment variables
ENV PORT=8055
ENV NODE_ENV=production

# Expose the port
EXPOSE ${PORT}

# Set proper permissions
USER root
RUN mkdir -p /app/uploads && \
    chmod -R 755 /app && \
    chown -R node:node /app

# Switch to non-root user
USER node

# Start Directus
CMD ["node", "node_modules/directus/dist/start.js"]