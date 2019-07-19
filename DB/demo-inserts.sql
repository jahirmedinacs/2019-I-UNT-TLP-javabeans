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