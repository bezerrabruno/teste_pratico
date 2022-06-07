# Teste Prático Programador Mobile

Esse foi um teste pratico feito para validar as minhas capacidades de programador.

# Instruções

### Mobile
Desenvolver uma Aplicação Mobile para uma escola utilizando o Flutter SDK/Dart, nela deve conter,listagem, cadastro, exclusão (desde que não esteja matriculado vinculada) e edição de cursos e alunos.
Deve haver a possibilidade de matricula de alunos em cursos


### API
Criação de API utilizando Node.js que atenda ao app utilizando o banco de dados PostgreSQL de acordo com o MER (Modelo Entidade Relacionamento).

# Implantação

Para configurar esse projeto manualmente siga os passos abaixo.

### Configurações do DB:
    1 - Instale o 'PostgreSQL'
    2 - Crie um db com o nome de 'test_pratico'.
    3 - Rode os codigos do diretorio 'database' dentro do banco.
    obs: O arquivo 'create_tables' é o unico obrigatorio.

### Configurações da API:
    1 - Instale o 'node.js'.
    1 - Entre em 'api_node/src/config/db_config.js' e confirme os dados de 'client'.
    2 - Rode a api.

### Configurações do App:
    1 - Verifique se o Flutter está na versão 3.0.0 ou maior.
    2 - Entre em 'app_mobile/lib/app/core/shared/utils/api.base.dart' e confirme o seu IP
    3 - Rode o app em AVD.
