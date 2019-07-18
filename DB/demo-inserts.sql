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
	(5,005, '1999-01-01', 'Primer Parcial'),
    (6,006, '1999-01-01', 'Primer Parcial'),
    (7,007, '1999-01-01', 'Primer Parcial'),
    (8,008, '1999-01-01', 'Primer Parcial'),

    (9,009, '1999-01-01', 'Nota del Curso'),
    (10,010, '1999-01-01', 'Nota del Curso'),
    (11,011, '1999-01-01', 'Nota del Curso'),
    (12,012, '1999-01-01', 'Nota del Curso'),
    
    (13,013, '1999-01-01', 'Examen Oral'),
    (14,014, '1999-01-01', 'Examen Oral'),
    (15,015, '1999-01-01', 'Examen Oral'),
    (16,016, '1999-01-01', 'Examen Oral'),
    
    (17,017, '1999-01-01', 'Trabajo Final de Unidad'),
    (18,018, '1999-01-01', 'Trabajo Final de Unidad'),
    (19,019, '1999-01-01', 'Trabajo Final de Unidad'),
    (20,020, '1999-01-01', 'Trabajo Final de Unidad');

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