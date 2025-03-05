FROM directus/directus:latest

# Railway automatically sets PORT environment variable
ENV PORT=8055

# Expose the port that Railway will use
EXPOSE ${PORT}

# Command to start Directus
CMD ["npx", "directus", "start"]