DROP DATABASE IF EXISTS es_deportes;
CREATE DATABASE IF NOT EXISTS es_deportes;

DROP USER IF EXISTS "non_root"@"%";
CREATE USER "non_root"@"%" IDENTIFIED BY "usuario3";
GRANT ALL PRIVILEGES ON es_deportes.* TO "non_root"@"%" WITH GRANT OPTION; -- WITH GRANT OPTION permite generar usuarios
GRANT SUPER ON *.* TO "non_root"@"%" WITH GRANT OPTION;