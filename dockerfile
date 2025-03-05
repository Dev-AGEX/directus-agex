FROM directus/directus:latest

# Copiar arquivos de configuração
COPY .env /directus/.env

# Railway.app usa a variável PORT automaticamente
ENV PORT=8055

# Expor a porta dinamicamente
EXPOSE ${PORT}

# Comando para iniciar o Directus
CMD ["npx", "directus", "start"]