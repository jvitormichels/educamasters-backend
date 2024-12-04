# Educamasters

A empresa Threewygo é uma empresa inovadora no mundo da educação online e estava determinada a criar a melhor plataforma de cursos de treinamento do mercado. Você, enquanto pessoa desenvolvedora, possui a missão de auxiliar essa empresa a realizar este desafio. 

O Gerente de Produto(GP) apresentou à equipe (Dev) a demanda que foi aprovada pelo Comitê de Produto, seguindo a seguinte solicitação:

>(GP): Olá, desenvolvedores. Tenho uma nova demanda para vocês. Precisamos criar uma tela inicial que seja responsiva em dispositivos móveis e que exiba todos os cursos que ainda estão ativos, ou seja, aqueles cuja data de término não foi ultrapassada, com os títulos e descrições dos cursos. O que você acha disso? 

> (Dev): Olá, GP. Entendi o requisito. Parece uma adição importante para melhorar a experiência do usuário. 

> (GP): Ótimo, a responsividade é fundamental. Além disso, é importante lembrar que em todos os cursos é possível visualizar um ou vários vídeos. Certifique-se de que a experiência de visualização de vídeos também seja otimizada para atender às necessidades dos nossos usuários. Certo?

> (Dev): Entendido, GP. A responsividade da visualização de vídeos também será prioridade no desenvolvimento. Vou garantir que os vídeos sejam reproduzidos de forma fluida e que a interface seja adaptada para proporcionar uma experiência de usuário agradável em todos os dispositivos.

Os requisitos para esse projeto são:

| Requisitos | Descrições
| -----------| -----------
| R.1 | A tela inicial deve exibir uma lista de cursos atuais.
| R.2 | Os cursos devem ser exibidos em um layout responsivo que funcione bem em dispositivos móveis.
| R.3 | Cada curso na lista deve incluir o título e a descrição do curso.
| R.4 | Os cursos devem ser filtrados com base na data de término, mostrando apenas cursos cuja data de término ainda não passou em relação à data atual.
| R.5 | Crie um formulário de cadastro de curso que inclua os campos da tabela.
| R.6 | Forneça uma maneira de editar e excluir cursos existentes.
| R.7 | Apresentação tamanho total ocupado pelos vídeos nos cursos.


> (GP): Olá Dev, como está indo o progresso do projeto? A gerência acabou de solicitar que implementemos uma nova funcionalidade que exigirá a extração de alguns relatórios dos cursos. Eles estão interessados em ver o tamanho total ocupado pelos vídeos nos cursos. Você acha que isso é possível? Não temos muitas restrições quanto à forma de apresentação, pode ser uma tela, uma query, um relatório ou qualquer outra forma que demonstre claramente o tamanho total ocupado pelos vídeos nos cursos. Tenho interesse em ver como você abordará essa tarefa.

 <hr/>

 # Instruções
 Para rodar este projeto, siga os seguintes passos em um terminal:
 * git clone https://github.com/jvitormichels/educamasters-backend.git
 * cd educamasters-backend
 * make build
 * make docker

Em um novo terminal, sem fechar o primeiro, faça o seguinte
 * make bash
 * rails db:migrate

Este passo é opcional, é o restore do banco a partir de um arquivo .dump, em conjunto com uma pasta de fotos e vídeos que pertencem aos registros do arquivo de dump.
Os arquivos para restauração do banco encontram-se dentro da pasta /backup.
* sudo cp -r backup/uploads/ public/
* sudo docker cp backup/educamasters_backup.sql educamasters-backend_db_1:/tmp/dump.sql
* pg_restore --host "0.0.0.0" --port "5432" --username "postgres" --no-password --dbname "postgres" --clean --verbose "/tmp/dump.sql"




