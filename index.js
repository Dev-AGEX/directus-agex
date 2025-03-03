const { createDirectus } = require('@directus/sdk');
const { startServer } = require('directus');

// Inicia o servidor Directus
startServer();

module.exports = async (req, res) => {
  // Este arquivo serve como ponto de entrada para a Vercel
  // O servidor Directus é iniciado automaticamente
  return res.status(200).send('Directus is running');
};
