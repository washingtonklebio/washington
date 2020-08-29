# Stop no banco de dados Mysql
sudo systemctl stop mysql

# Exportar apenas a estrutura do banco de dados
mysqldump -d -u <user> -p <database> > <arquivo.sql>

# Importação da estrutura gerada para o banco de dados
mysql -u <user> -p <database> < <arquivo.sql>


# Definir a senha root pela primeira vez
mysqladmin.exe -u root password nova_senha

# Alterar senha root
USE mysql;
UPDATE user SET password = PASSWORD('123456') WHERE user='root';
FLUSH PRIVILEGES;

# listar usuarios
USE mysql;
SELECT user,host FROM user;

# criar usuario
CREATE USER '<USERNAME>'@'<SERVER_HOSTNAME>' IDENTIFIED BY '<PASSWORD>';

# dar permissões para o usuário
GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER,INDEX on <DB_NAME>.* TO '<USERNAME>'@'<SERVER_HOSTNAME>' IDENTIFIED BY '<PASSWORD>';
flush privileges;

# apagar usuário
DROP USER '<USERNAME>'@'<SERVER_HOSTNAME>';

# Privilégios Globais #

# remove todos os privilegios globais
REVOKE ALL PRIVILEGES ON *.* FROM '<USERNAME>'@'<SERVER_HOSTNAME>'; 

# retira permissao Grand
REVOKE GRANT OPTION ON *.* FROM '<USERNAME>'@'<SERVER_HOSTNAME>'; 

# todos
GRANT ALL PRIVILEGES ON * . * TO  '<USERNAME>'@'<SERVER_HOSTNAME>' WITH GRANT OPTION MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;

# selecionados
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, RELOAD, SHUTDOWN, PROCESS, FILE, REFERENCES, INDEX, ALTER, SHOW DATABASES, SUPER, CREATE TEMPORARY TABLES, LOCK TABLES, REPLICATION SLAVE, REPLICATION CLIENT, CREATE VIEW, EVENT, TRIGGER, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, CREATE USER, EXECUTE ON * . * TO  '<USERNAME>'@'<SERVER_HOSTNAME>' WITH GRANT OPTION MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;

# Privilégios específicos da Base de Dados #

# remove todos os privilegios do usuario para esse banco
REVOKE ALL PRIVILEGES ON  `<BD_NAME>` . * FROM  '<USERNAME>'@'<SERVER_HOSTNAME>';

# todos
GRANT ALL PRIVILEGES ON  `<BD_NAME>` . * TO  '<USERNAME>'@'<SERVER_HOSTNAME>' WITH GRANT OPTION ;

# selecionados
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, REFERENCES, INDEX, ALTER, CREATE TEMPORARY TABLES, LOCK TABLES, CREATE VIEW, EVENT, TRIGGER, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, EXECUTE ON  `<BD_NAME>` . * TO  '<USERNAME>'@'<SERVER_HOSTNAME>' WITH GRANT OPTION ;

# Checa se o login mysql é: auth_socket. Se for, troca para mysql_native_password
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'SUA_SENHA_ROOT';

# Checa autenticação
SELECT user,authentication_string,plugin,host FROM mysql.user;
