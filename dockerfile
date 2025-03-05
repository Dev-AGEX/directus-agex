FROM directus/directus:latest

# Copy configuration files
COPY .env /directus/.env
COPY package.json /directus/package.json

# Set environment variables
ENV PORT=8055
ENV NODE_ENV=production

# Expose the port
EXPOSE ${PORT}

# Set proper permissions
USER root
RUN chmod -R 755 /directus/node_modules/.bin/
RUN chown -R node:node /directus/

# Switch to non-root user
USER node

# Start Directus
CMD ["node", "node_modules/directus/dist/start.js"]