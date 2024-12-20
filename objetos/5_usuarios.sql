USE es_deportes;

DROP USER IF EXISTS
  'usuario_1'@'%',
  'usuario_2'@'%', 
  'usuario_3'@'%';



CREATE USER "usuario_1"@"%" IDENTIFIED BY "usuario1";
GRANT SELECT ON es_deportes.vw_ventas_empleado_local  TO "usuario_1"@"%";
GRANT SELECT ON es_deportes.vw_compras_completadas TO "usuario_1"@"%";


-- Creación de usuario 2 con acceso de solo lectura a todas las tablas de la base de datos es_deportes
CREATE USER "usuario_2"@"%" IDENTIFIED BY "usuario2";
GRANT SELECT ON es_deportes.* TO "usuario_2"@"%";


-- Creación de usuario 3 con acceso completo a todas las tablas y objetos de la base de datos es_deportes
CREATE USER "usuario_3"@"%" IDENTIFIED BY "usuario3";
GRANT ALL PRIVILEGES ON es_deportes.* TO "usuario_3"@"%";


-- Actualiza los privilegios para que tengan efecto inmediato
FLUSH PRIVILEGES;

-- Verifica la creación de los usuarios y sus permisos
SELECT * FROM mysql.user;