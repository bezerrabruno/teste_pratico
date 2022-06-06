const Client = require('pg').Client;

const client = new Client({
    user: 'postgres',
    password: 'Weshier@123',
    host: '127.0.0.1',
    database: 'teste_pratico',
    port: 5432,
});

client.connect();

client.on('error', console.log.bind(console, 'Erro de conexão'));

client.once('open', () => {
    console.log('Conexão com o banco feita com sucesso')
})

module.exports = client;
