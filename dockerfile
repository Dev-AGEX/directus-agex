FROM directus/directus:latest

# Copiar arquivos de configuração
COPY .env /directus/.env

# Expor a porta que o Directus usa
EXPOSE 8055

# Comando para iniciar o Directus
CMD ["npx", "directus", "start"]