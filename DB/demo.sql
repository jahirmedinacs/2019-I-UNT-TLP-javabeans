INSERT INTO usuario(id, nombre, codigo, primerapellido, segundoapellido, segundonombre, nacimiento, tipo, userid) VALUES
    (0105, 'TLP', 0105,'Demostracion','Alumno','','1980-01-01', 1, 'tlpalumno');
INSERT INTO usuario(id, nombre, codigo, primerapellido, segundoapellido, segundonombre, nacimiento, tipo, userid) VALUES
    (0106, 'TLP', 0106,'Demostracion','Profesor','','1980-01-01', 1, 'tlpprofesor');
INSERT INTO usuario(id, nombre, codigo, primerapellido, segundoapellido, segundonombre, nacimiento, tipo, userid) VALUES
    (0107, 'TLP', 0107,'Demostracion','Administrador','','1980-01-01', 1, 'tlpadministrador');


CREATE USER 'tlpalumno'@'localhost' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON * . * TO 'tlpalumno'@'localhost' IDENTIFIED BY '123456' WITH GRANT OPTION;
GRANT CREATE USER on *.* TO 'tlpalumno'@'localhost' IDENTIFIED BY '123456' WITH GRANT OPTION;

FLUSH PRIVILEGES;

CREATE USER 'tlpprofesor'@'localhost' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON * . * TO 'tlpprofesor'@'localhost' IDENTIFIED BY '123456' WITH GRANT OPTION;
GRANT CREATE USER on *.* TO 'tlpprofesor'@'localhost' IDENTIFIED BY '123456' WITH GRANT OPTION;

FLUSH PRIVILEGES;

CREATE USER 'tlpadministrador'@'localhost' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON * . * TO 'tlpadministrador'@'localhost' IDENTIFIED BY '123456' WITH GRANT OPTION;
GRANT CREATE USER on *.* TO 'tlpadministrador'@'localhost' IDENTIFIED BY '123456' WITH GRANT OPTION;

FLUSH PRIVILEGES;