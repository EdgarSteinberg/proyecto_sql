# para levantar este contenedor con el servidor de mysql:
docker compose up --build -d 

# me permite conectarme internamente al contenedor comandos ls -la  -   ls -l
docker exec -it mysql-server bash

# dar de baja la base de datos
docker compose down



# crear la base de datos desde el codigo sql creado
docker exec -it mysql-server mysql --verbose -u root -p -e "source /proyecto_sql/estructura.sql;" 
docker exec -it -e MYSQL_PWD="coderhouse" mysql-server mysql -u root -e "source /proyecto_sql/estructura.sql;" 

# ver las tablas 
docker exec -it mysql-server mysql --verbose -u root -p -e "SHOW TABLES FROM es_deportes;" 
docker exec -it -e MYSQL_PWD="coderhouse" mysql-server mysql -u root -e "SHOW TABLES FROM es_deportes;" 

# popular la base de datos
docker exec -it mysql-server mysql --verbose -u root -p -e "source /proyecto_sql/population.sql;"
docker exec -it -e MYSQL_PWD="coderhouse" mysql-server mysql -u root -e "source /proyecto_sql/population.sql;"

# eliminar base de datos 
docker exec -it mysql-server mysql --verbose -u root -p -e "DROP DATABASE IF EXISTS es_deportes;" 
docker exec -it -e MYSQL_PWD="coderhouse" mysql-server mysql -u root -e "DROP DATABASE IF EXISTS es_deportes;" 




# crear base de datos
docker exec -it mysql-server mysql \
 --verbose \
 -u root \
 -p -e "\
DROP DATABASE IF EXISTS donaton; 
source /proyecto_sql/estructura.sql; \
source /proyecto_sql/population.sql; \
source /proyecto_sql/objetos/1_vistas.sql; \
source /proyecto_sql/objetos/2_funciones.sql; \
source /proyecto_sql/objetos/3_procedimientos.sql; \
source /proyecto_sql/objetos/4_triggers.sql; \
source /proyecto_sql/objetos/5_usuarios.sql;"





#usuarios levantar todo el proyecto como non-root
# crear base de datos

docker exec -it -e MYSQL_PWD="coderhouse" mysql-server \
 mysql \
 --verbose \
 -u root \
 -e "\
source /proyecto_sql/usuario-non-root.sql;"


docker exec -it -e MYSQL_PWD="usuario3" mysql-server\
 mysql \
 --verbose \
 -u non_root \
 -e "\
source /proyecto_sql/estructura.sql; \
source /proyecto_sql/population.sql; \
source /proyecto_sql/objetos/1_vistas.sql; \
source /proyecto_sql/objetos/2_funciones.sql; \
source /proyecto_sql/objetos/3_procedimientos.sql; \
source /proyecto_sql/objetos/4_triggers.sql;
source /proyecto_sql/objetos/5_usuarios.sql;"




# final con errores seguramente jaja
docker exec -it mysql-server mysql \
 --verbose \
 -u non_root \
 -p -e "\
source /proyecto_sql/estructura.sql; \
source /proyecto_sql/population.sql; \
source /proyecto_sql/objetos/1_vistas.sql; \
source /proyecto_sql/objetos/2_funciones.sql; \
source /proyecto_sql/objetos/3_procedimientos.sql; \
source /proyecto_sql/objetos/4_triggers.sql;
source /proyecto_sql/objetos/5_usuarios.sql;
source /proyecto_sql/objetos/6_procedure_tcl.sql;"