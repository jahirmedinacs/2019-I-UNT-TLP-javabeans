-- 
-- DATABASE
-- 

drop database if exists registroNotas;
create database registroNotas;
use registroNotas;
CREATE TABLE curso(
  id INT(11) NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  n_horas INT(11) NOT NULL,
  creditos INT(2) NOT NULL,
  PRIMARY KEY (id));

CREATE TABLE usuario (
  id INT(11) NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(200) NOT NULL,
  codigo INT(11) NOT NULL,
  primerapellido VARCHAR(200) NOT NULL,
  segundoapellido VARCHAR(200) NULL,
  segundonombre VARCHAR(200) NULL,
  nacimiento DATE NOT NULL,
  tipo INT(1) NOT NULL,
  userid VARCHAR(200) NOT NULL,
  PRIMARY KEY (id));
  
CREATE TABLE matricula (
  curso_id INT(11) NOT NULL,
  usuario_id INT(11) NOT NULL,
  fecha DATE NULL,
  vence DATE NULL,
  activo boolean NULL,
  expulsado boolean NULL,
  PRIMARY KEY (curso_id, usuario_id),
  CONSTRAINT matricula_curso   FOREIGN KEY (curso_id)   REFERENCES curso (id),
  CONSTRAINT matricula_usuario FOREIGN KEY (usuario_id) REFERENCES usuario (id)
);

CREATE TABLE profesorea (
  curso_id INT(11) NOT NULL,
  usuario_id INT(11) NOT NULL,
  fecha DATE NULL,
  vence DATE NULL,
  activo boolean NULL,
  PRIMARY KEY (curso_id, usuario_id),
  CONSTRAINT profesorea_curso   FOREIGN KEY (curso_id)   REFERENCES curso (id),
  CONSTRAINT profesorea_usuario FOREIGN KEY (usuario_id) REFERENCES usuario (id)
);
  
CREATE TABLE nota(
  id INT(11) NOT NULL AUTO_INCREMENT,
  notas INT(11) NOT NULL,
  primerarevision boolean NULL,
  segundaversion boolean NULL,
  parcial boolean NULL,
  final boolean NULL,
  promocional boolean NULL,
  primary key(id)
  );
  
CREATE TABLE registro (
  curso_id INT(11) NOT NULL,
  nota_id INT(11) NOT NULL,
  fecha DATE NOT NULL,
  observacion TEXT(200) NULL,
  PRIMARY KEY (curso_id, nota_id),
  CONSTRAINT registro_curso FOREIGN KEY (curso_id)  REFERENCES curso (id),
  CONSTRAINT registro_nota FOREIGN KEY (nota_id) REFERENCES nota (id)
);

CREATE TABLE reporte (
  nota_id INT(11) NOT NULL,
  usuario_id INT(11) NOT NULL,
  observacion VARCHAR(200) NULL,
  fechaconsulta VARCHAR(200) NULL,
  PRIMARY KEY (nota_id, usuario_id),
  CONSTRAINT reporte_nota FOREIGN KEY (nota_id)    REFERENCES nota (id),
  CONSTRAINT reporte_usuario  FOREIGN KEY (usuario_id) REFERENCES usuario (id)
);

CREATE TABLE registroGeneral (
  id INT(11) NOT NULL AUTO_INCREMENT,
  curso_id INT(11) NOT NULL,
  nota_id INT(11) NOT NULL,
  usuario_id INT(11) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT registroGeneral_curso FOREIGN KEY (curso_id) REFERENCES curso (id),
  CONSTRAINT registroGeneral_nota FOREIGN KEY (nota_id)  REFERENCES nota (id),
  CONSTRAINT registroGeneral_usuario FOREIGN KEY (usuario_id) REFERENCES usuario (id)
);

INSERT INTO curso(id, nombre, n_horas, creditos) VALUES
	(1, 'Algebra Lineal', 72, 4),
    (2, 'Matematica Discreta', 72, 4),
    (3, 'Computacion Logica', 72, 4);
INSERT INTO usuario(id, nombre, codigo, primerapellido, segundoapellido, segundonombre, nacimiento, tipo, userid) VALUES
	(0001, 'Carlos', 1012700315,'Rodriguez','Lujan','Alberto','1994-04-27', 1, 'lujan'),
    (0002, 'Emerson', 1012700415, 'Salinas','Grados','Jhosep', '1995-04-03', 1, 'salinas'),
    (0003, 'Alexander', 1012700515,'Miranda','Robles','Celso','1996-06-04', 2, 'miranda'),
    (0004, 'Jahir', 000000000,'Medina','Lopez','Gilberh','1994-04-27', 3, 'jahirmedinacs');
INSERT INTO matricula(curso_id, usuario_id, fecha, vence, activo, expulsado) VALUES
	(1,0001,'2015-08-15','2015-12-15', 1,0),
    (2,0001,'2015-08-15','2015-12-15', 1,0),
    (2,0002,'2015-08-16','2015-12-15', 1,0),
    (3,0003,'2018-08-20','2015-12-15', 1,0);
INSERT INTO nota(id, notas, primerarevision, segundaversion, parcial, final, promocional) VALUES
	(001,5, 1, 1, 1, 1, 1),
    (002,5, 1,0, 1, 1, 1),
    (003,5,0,0, 1, 1, 1),
    (004,5, 1,0, 1, 1, 1);
INSERT INTO registro(curso_id, nota_id, fecha, observacion) VALUES
	(1,001,'2015-12-07','Muy Buenas Calificaciones'),
    (2,002,'2015-12-06','Buenas Calificaciones'),
    (2,003,'2015-12-04','Pudo Mejorar'),
    (3,004,'2015-12-05','Buenas Calificaciones');
INSERT INTO reporte(nota_id, usuario_id, observacion, fechaconsulta) VALUES
	(001,0001,'Excelente','2015-11-12'),
    (002,0001,'Bueno','2015-11-28'),
    (003,0002,'Malo','2015-12-02'),
    (004,0003,'Bueno','2015-11-05');
INSERT INTO registroGeneral(id, curso_id, nota_id, usuario_id) VALUES
	  (1,1,001,0001),
    (2,2,002,0001),
    (3,2,003,0002),
    (4,3,004,0003);




-- 
-- INSERTS
-- 

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

--

INSERT INTO curso(id, nombre, n_horas, creditos) VALUES
    (4, 'Teoria de la Computacion', 72, 4),
    (5, 'Topicos en Ciencias de la Computacion I', 72, 4),
    (6, 'Procesamiento Grafico', 32, 4),
    (7, 'Lenguajes de Programacion', 72, 4),
    (8, 'Redes y Servidores', 72, 6),
    (9, 'Literatura', 60, 2);

INSERT INTO matricula(curso_id, usuario_id, fecha, vence, activo, expulsado) VALUES
	(4,0105,'2015-08-15','2015-12-15', 1, 0),
    (6,0105,'2015-08-15','2015-12-15', 1, 0),
    (8,0105,'2015-08-16','2015-12-15', 1, 0),
    (9,0105,'2018-08-20','2015-12-15', 1, 0);

INSERT INTO nota(id, notas, primerarevision, segundaversion, parcial, final, promocional) VALUES
(005, 20, 1, 0, 1, 1, 0),
(006, 20, 1, 0, 1, 1, 0),
(007, 20, 1, 0, 1, 1, 0),
(008, 20, 1, 0, 1, 1, 0),

(009, 15, 1, 1, 1, 1, 1),
(010, 15, 1, 1, 1, 1, 1),
(011, 15, 1, 1, 1, 1, 1),
(012, 15, 1, 1, 1, 1, 1),

(013, 10, 1, 0, 0, 1, 0),
(014, 10, 1, 0, 0, 1, 0),
(015, 10, 1, 0, 0, 1, 0),
(016, 5, 1, 0, 0, 1, 0),

(017, 16, 1, 0, 1, 1, 0),
(018, 12, 1, 0, 1, 1, 0),
(019, 12, 1, 0, 1, 1, 0),
(020, 12, 1, 0, 1, 1, 0);

INSERT INTO registro(curso_id, nota_id, fecha, observacion) VALUES
	(4,005, '1999-01-01', 'Primer Parcial'),
    (6,006, '1999-01-01', 'Primer Parcial'),
    (8,007, '1999-01-01', 'Primer Parcial'),
    (9,008, '1999-01-01', 'Primer Parcial'),

    (4,009, '1999-01-01', 'Nota del Curso'),
    (6,010, '1999-01-01', 'Nota del Curso'),
    (8,011, '1999-01-01', 'Nota del Curso'),
    (9,012, '1999-01-01', 'Nota del Curso'),
    
    (4,013, '1999-01-01', 'Examen Oral'),
    (6,014, '1999-01-01', 'Examen Oral'),
    (8,015, '1999-01-01', 'Examen Oral'),
    (9,016, '1999-01-01', 'Examen Oral'),
    
    (4,017, '1999-01-01', 'Trabajo Final de Unidad'),
    (6,018, '1999-01-01', 'Trabajo Final de Unidad'),
    (8,019, '1999-01-01', 'Trabajo Final de Unidad'),
    (9,020, '1999-01-01', 'Trabajo Final de Unidad');

INSERT INTO reporte(nota_id, usuario_id, observacion, fechaconsulta) VALUES
	(5,0105, 'Sin Inconvenientes', '1999-01-01'),
    (6,0105, 'Sin Inconvenientes', '1999-01-01'),
    (7,0105, 'Sin Inconvenientes', '1999-01-01'),
    (8,0105, 'Sin Inconvenientes', '1999-01-01'),

    (9,0105, 'Sin Inconvenientes', '1999-01-01'),
    (10,0105, 'Sin Inconvenientes', '1999-01-01'),
    (11,0105, 'Sin Inconvenientes', '1999-01-01'),
    (12,0105, 'Sin Inconvenientes', '1999-01-01'),
    
    (13,0105, 'Sin Inconvenientes', '1999-01-01'),
    (14,0105, 'Sin Inconvenientes', '1999-01-01'),
    (15,0105, 'Sin Inconvenientes', '1999-01-01'),
    (16,0105, 'Se le desconto puntaje por usar terminos inadecuados', '1999-01-01'),
    
    (17,0105, 'Justifacion de Tarea Incompleta', '1999-01-01'),
    (18,0105, 'Sin Inconvenientes', '1999-01-01'),
    (19,0105, 'Sin Inconvenientes', '1999-01-01'),
    (20,0105, 'Sin Inconvenientes', '1999-01-01');

INSERT INTO registroGeneral(id, curso_id, nota_id, usuario_id) VALUES
	(5,4,005,0105),
    (6,6,006,0105),
    (7,8,007,0105),
    (8,9,008,0105),

    (9,4,009,0105),
    (10,6,010,0105),
    (11,8,011,0105),
    (12,9,012,0105),
    
    (13,4,013,0105),
    (14,6,014,0105),
    (15,8,015,0105),
    (16,9,016,0105),
    
    (17,4,017,0105),
    (18,6,018,0105),
    (19,8,019,0105),
    (20,9,020,0105);

-- 
-- 
--  OTRO ALUMNO
-- 
-- 

INSERT INTO matricula(curso_id, usuario_id, fecha, vence, activo, expulsado) VALUES
	(4,0109,'2015-08-15','2015-12-15', 1, 0),
    (6,0109,'2015-08-15','2015-12-15', 1, 0),
    (8,0109,'2015-08-16','2015-12-15', 1, 0),
    (7,0109,'2018-08-20','2015-12-15', 1, 0);

INSERT INTO nota(id, notas, primerarevision, segundaversion, parcial, final, promocional) VALUES
(021, 20, 1, 0, 1, 1, 0),
(022, 20, 1, 0, 1, 1, 0),
(023, 0, 0, 0, 1, 0, 0),
(024, 20, 1, 0, 1, 1, 0),

(025, 15, 1, 1, 1, 1, 1),
(026, 15, 1, 1, 1, 1, 1),
(027, 15, 1, 1, 1, 1, 1),
(028, 15, 1, 1, 1, 1, 1),

(029, 10, 1, 0, 0, 1, 0),
(030, 10, 1, 0, 0, 1, 0),
(031, 10, 1, 0, 0, 1, 0),
(032, 5, 1, 0, 0, 1, 0),

(033, 16, 1, 0, 1, 1, 0),
(034, 12, 1, 0, 1, 1, 0),
(035, 12, 1, 0, 1, 1, 0),
(036, 12, 1, 0, 1, 1, 0);

INSERT INTO registro(curso_id, nota_id, fecha, observacion) VALUES
	(4,021, '1999-01-01', 'Primer Parcial'),
    (6,022, '1999-01-01', 'Primer Parcial'),
    (8,023, '1999-01-01', 'Primer Parcial'),
    (7,024, '1999-01-01', 'Primer Parcial'),

    (4,025, '1999-01-01', 'Nota del Curso'),
    (6,026, '1999-01-01', 'Nota del Curso'),
    (8,027, '1999-01-01', 'Nota del Curso'),
    (7,028, '1999-01-01', 'Nota del Curso'),
    
    (4,029, '1999-01-01', 'Examen Oral'),
    (6,030, '1999-01-01', 'Examen Oral'),
    (8,031, '1999-01-01', 'Examen Oral'),
    (7,032, '1999-01-01', 'Examen Oral'),
    
    (4,033, '1999-01-01', 'Trabajo Final de Unidad'),
    (6,034, '1999-01-01', 'Trabajo Final de Unidad'),
    (8,035, '1999-01-01', 'Trabajo Final de Unidad'),
    (7,036, '1999-01-01', 'Trabajo Final de Unidad');

INSERT INTO reporte(nota_id, usuario_id, observacion, fechaconsulta) VALUES
	(021,0109, 'Sin Inconvenientes', '1999-01-01'),
    (022,0109, 'Sin Inconvenientes', '1999-01-01'),
    (023,0109, 'Se le encontro copiando', '1999-01-01'),
    (024,0109, 'Sin Inconvenientes', '1999-01-01'),

    (025,0109, 'Sin Inconvenientes', '1999-01-01'),
    (026,0109, 'Sin Inconvenientes', '1999-01-01'),
    (027,0109, 'Sin Inconvenientes', '1999-01-01'),
    (028,0109, 'Sin Inconvenientes', '1999-01-01'),
    
    (029,0109, 'Sin Inconvenientes', '1999-01-01'),
    (030,0109, 'Sin Inconvenientes', '1999-01-01'),
    (031,0109, 'Sin Inconvenientes', '1999-01-01'),
    (032,0109, 'Se le desconto puntaje por usar terminos inadecuados', '1999-01-01'),
    
    (033,0109, 'Justifacion de Tarea Incompleta', '1999-01-01'),
    (034,0109, 'Sin Inconvenientes', '1999-01-01'),
    (035,0109, 'Sin Inconvenientes', '1999-01-01'),
    (036,0109, 'Sin Inconvenientes', '1999-01-01');

INSERT INTO registroGeneral(id, curso_id, nota_id, usuario_id) VALUES
	(21,4,021,0109),
    (22,6,022,0109),
    (23,8,023,0109),
    (24,7,024,0109),

    (25,4,025,0109),
    (26,6,026,0109),
    (27,8,027,0109),
    (28,7,028,0109),
    
    (29,4,029,0109),
    (30,6,030,0109),
    (31,8,031,0109),
    (32,7,032,0109),
    
    (33,4,033,0109),
    (34,6,034,0109),
    (35,8,035,0109),
    (36,7,036,0109);

-- 
--

INSERT INTO profesorea(curso_id, usuario_id, fecha, vence, activo) VALUES
	(4,0106,'2015-08-15','2015-12-15', 1),
    (6,0106,'2015-08-15','2015-12-15', 1),
    (8,0106,'2015-08-16','2015-12-15', 1),
    (9,0106,'2018-08-20','2015-12-15', 1),
    (7,0116,'2018-08-20','2015-12-15', 1);

-- 
-- CREDENTIALS
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