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
