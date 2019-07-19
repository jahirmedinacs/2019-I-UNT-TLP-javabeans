INSERT INTO usuario(id, nombre, codigo, primerapellido, segundoapellido, segundonombre, nacimiento, tipo, userid) VALUES
    (0105, 'TLP', 0105,'Demostracion','Alumno','','1980-01-01', 1, 'tlpalumno');
INSERT INTO usuario(id, nombre, codigo, primerapellido, segundoapellido, segundonombre, nacimiento, tipo, userid) VALUES
    (0106, 'TLP', 0106,'Demostracion','Profesor','','1980-01-01', 2, 'tlpprofesor');
-- 
-- Otro ALumno
-- 
INSERT INTO usuario(id, nombre, codigo, primerapellido, segundoapellido, segundonombre, nacimiento, tipo, userid) VALUES
    (0109, 'Otro', 0109,'Alumno','Demostracion','','1985-01-01', 1, 'otroalumno');

-- 
-- Otro Profesor
-- 
INSERT INTO usuario(id, nombre, codigo, primerapellido, segundoapellido, segundonombre, nacimiento, tipo, userid) VALUES
    (0116, 'Otro', 0116,'Profesor','Demostracion','','1985-01-01', 2, 'otroprofesor');

-- 
-- 
-- 

CREATE USER 'tlpalumno'@'localhost' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON * . * TO 'tlpalumno'@'localhost' IDENTIFIED BY '123456' WITH GRANT OPTION;
GRANT CREATE USER on *.* TO 'tlpalumno'@'localhost' IDENTIFIED BY '123456' WITH GRANT OPTION;

FLUSH PRIVILEGES;

CREATE USER 'tlpprofesor'@'localhost' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON * . * TO 'tlpprofesor'@'localhost' IDENTIFIED BY '123456' WITH GRANT OPTION;
GRANT CREATE USER on *.* TO 'tlpprofesor'@'localhost' IDENTIFIED BY '123456' WITH GRANT OPTION;

FLUSH PRIVILEGES;

CREATE USER 'otroalumno'@'localhost' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON * . * TO 'otroalumno'@'localhost' IDENTIFIED BY '123456' WITH GRANT OPTION;
GRANT CREATE USER on *.* TO 'otroalumno'@'localhost' IDENTIFIED BY '123456' WITH GRANT OPTION;

FLUSH PRIVILEGES;

CREATE USER 'otroprofesor'@'localhost' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON * . * TO 'otroprofesor'@'localhost' IDENTIFIED BY '123456' WITH GRANT OPTION;
GRANT CREATE USER on *.* TO 'otroprofesor'@'localhost' IDENTIFIED BY '123456' WITH GRANT OPTION;

FLUSH PRIVILEGES;