
-- Crear la base de datos si no existe
DROP DATABASE IF EXISTS es_deportes;
CREATE DATABASE IF NOT EXISTS es_deportes;

-- Crear el usuario 'non_root' con contraseña 'usuario3'
DROP USER IF EXISTS "non_root"@"%";
CREATE USER "non_root"@"%" IDENTIFIED BY "usuario3";

-- Otorgar privilegios completos sobre la base de datos 'es_deportes' a 'non_root'
GRANT ALL PRIVILEGES ON es_deportes.* TO "non_root"@"%" WITH GRANT OPTION;

-- Otorgar privilegio SUPER (acceso total a operaciones del sistema) a 'non_root'
GRANT SUPER ON *.* TO "non_root"@"%" WITH GRANT OPTION;

-- Asegurar que los cambios se apliquen
FLUSH PRIVILEGES;
