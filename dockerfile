FROM directus/directus:latest

COPY package.json /directus/package.json

ENV PORT=8055

EXPOSE ${PORT}

CMD ["npm", "start"]