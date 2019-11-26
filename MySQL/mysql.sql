# Stop no banco de dados Mysql
sudo systemctl stop mysql

# Exportar apenas a estrutura do banco de dados
mysqldump -d -u <user> -p <database> > <arquivo.sql>

# Importação da estrutura gerada para o banco de dados
mysql -u <user> <database> < <arquivo.sql>
