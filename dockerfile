FROM node:18

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install --omit=dev

# Copy project files
COPY . .

# Create uploads directory and set permissions
RUN mkdir -p uploads && \
    chown -R node:node /app && \
    chmod -R 755 /app

# Set environment variables
ENV PORT=8055
ENV NODE_ENV=production

# Expose port
EXPOSE ${PORT}

# Switch to non-root user
USER node

# Start command
CMD ["npm", "start"]