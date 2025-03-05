FROM directus/directus:latest

# Copy configuration files
COPY .env /directus/.env
COPY package.json /directus/package.json

# Set environment variables
ENV PORT=8055
ENV NODE_ENV=production
ENV NPM_CONFIG_OMIT=dev

# Expose the port
EXPOSE ${PORT}

# Set proper permissions
USER root
RUN npm install --omit=dev
RUN chmod -R 755 /directus/node_modules/.bin/
RUN chown -R node:node /directus/
RUN mkdir -p /directus/uploads && chown -R node:node /directus/uploads

# Switch to non-root user
USER node

# Start Directus
CMD ["npx", "--no-install", "directus", "start"]