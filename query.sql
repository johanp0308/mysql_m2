

DROP TABLE IF EXISTS Asistencia;
DROP TABLE IF EXISTS Estudiante;
DROP TABLE IF EXISTS Curso;
DROP TABLE IF EXISTS Examen;
DROP TABLE IF EXISTS Session_Academica;
DROP TABLE IF EXISTS Profesores;
DROP TABLE IF EXISTS Pariente;
DROP TABLE IF EXISTS Departamento;
DROP TABLE IF EXISTS Facultad;




CREATE TABLE IF NOT EXISTS Asistencia(
    id INT UNSIGNED NOT NULL,
    fk_estudiante_id INT UNSIGNED NOT NULL,
    fk_curso_id INT UNSIGNED NOT NULL,
    marcador_asistencia VARCHAR(30) NOT NULL
); 
-- Primary KEY (Assistencia)
/* ALTER TABLE Asistencia DROP PRIMARY KEY (id); */
ALTER TABLE Asistencia ADD CONSTRAINT PK_Asistencia_Id PRIMARY KEY (id);

CREATE TABLE IF NOT EXISTS Profesores(
    id INT UNSIGNED NOT NULL,
    nombres VARCHAR(30) NOT NULL,
    apellidos VARCHAR(30) NOT NULL,
    fk_departamento_id INT UNSIGNED NOT NULL,
    email VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    direccion VARCHAR(50) NOT NULL
);
-- Primary Keys (Profesores)
ALTER TABLE Profesores ADD CONSTRAINT PK_Profesores_Id PRIMARY KEY (id);
--
-- Campos Unicos (Profesores)
ALTER TABLE Profesores 
ADD CONSTRAINT UQ_Profesor_Email UNIQUE (email),
ADD CONSTRAINT UQ_Profesor_Telefono UNIQUE (telefono);
--

CREATE TABLE IF NOT EXISTS Estudiante(
    id INT UNSIGNED NOT NULL,
    nombres VARCHAR(30) NOT NULL,
    apellidos VARCHAR(30) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    pariente_id INT UNSIGNED NOT NULL,
    email VARCHAR(50) NOT NULL
);

-- Primary Key (Estudiante)
ALTER TABLE Estudiante ADD CONSTRAINT PK_Estudiante_Id PRIMARY KEY (id);
-- Atributos Unicos
ALTER TABLE Estudiante ADD CONSTRAINT UQ_Estudiante_Email UNIQUE (email);
--

CREATE TABLE IF NOT EXISTS Pariente(
    id INT UNSIGNED NOT NULL,
    nombres VARCHAR(30) NOT NULL,
    apellidos VARCHAR(30) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(40) NOT NULL
);
-- Primary Keys (Pariente)
ALTER TABLE Pariente ADD CONSTRAINT PK_Pariente_Id PRIMARY KEY (id);
-- Atributos Unicos
ALTER TABLE Pariente ADD CONSTRAINT UQ_Pariente_email UNIQUE (email);
--

CREATE TABLE IF NOT EXISTS Departamento(
    id INT UNSIGNED NOT NULL,
    nombre_departamento VARCHAR(30) NOT NULL,
    fk_Facultad_id INT UNSIGNED NOT NULL,
    ubicacion VARCHAR(50) NOT NULL,
    email VARCHAR(40) NOT NULL,
    telefono VARCHAR(40) NOT NULL
);
-- Primary Key (Departamento)
ALTER TABLE Departamento ADD CONSTRAINT PK_Departamento_Id PRIMARY KEY (id);
-- Atributos Unicos
ALTER TABLE Departamento 
    ADD CONSTRAINT UQ_Departamento_email UNIQUE (email),
    ADd CONSTRAINT UQ_Departamento_telefono UNIQUE (telefono);

CREATE TABLE IF NOT EXISTS Curso(
    id INT UNSIGNED NOT NULL,
    titulo VARCHAR(30) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_terminacion DATE NOT NULL,
    max_cupo INT UNSIGNED NOT NULL,
    fk_departament_id INT UNSIGNED NOT NULL,
    fk_profesor_id INT UNSIGNED NOT NULL
);

-- Primary key (Curiso)
ALTER TABLE Curso ADD CONSTRAINT PK_Curso_id PRIMARY KEY (id);
-- Atributos Unicos 
ALTER TABLE Curso ADD CONSTRAINT UQ_Curso_titulo UNIQUE (titulo);

CREATE TABLE IF NOT EXISTS Examen(
    id INT UNSIGNED NOT NULL,
    Fecha_examen DATE NOT NULL,
    resultado VARCHAR(255) NOT NULL,
    estado VARCHAR(255) NOT NULL,
    fk_estudiante_id INT UNSIGNED NOT NULL,
    fk_curso_id INT UNSIGNED NOT NULL
);
-- Primary Key (Examen)
ALTER TABLE Examen ADD CONSTRAINT PK_Examen_id PRIMARY KEY (id);

ALTER TABLE Examen ADD CONSTRAINT UQ_Examen_estudiante UNIQUE (fk_estudiante_id);
--

CREATE TABLE IF NOT EXISTS Facultad(
    id INT UNSIGNED NOT NULL,
    facultad_title VARCHAR(30) NOT NULL,
    telefono_facultad VARCHAR(30) NOT NULL,
    ubicacion TEXT NOT NULL
);
-- Primary Key (Facultad)
ALTER TABLE Facultad ADD CONSTRAINT PK_Facultad_id PRIMARY KEY (id);

ALTER TABLE Facultad 
    ADD CONSTRAINT UQ_Facultad_titulo UNIQUE (facultad_title),
    ADD CONSTRAINT UQ_Facultad_telefono UNIQUE(telefono_facultad);
--
CREATE TABLE IF NOT EXISTS Session_Academica(
    id INT UNSIGNED NOT NULL,
    tipo_session TEXT NOT NULL,
    fecha_session DATE NOT NULL,
    fk_estudiante_id INT UNSIGNED NOT NULL,
    fk_departamento_id INT UNSIGNED NOT NULL,
    estado VARCHAR(30) NOT NULL
);
-- Primary Keys (Session_Academica)
ALTER TABLE Session_Academica ADD CONSTRAINT PK_Session_Academica PRIMARY KEY (id);
-- Foreign Keys

ALTER TABLE Asistencia 
    ADD CONSTRAINT FK_Asistencia_Estudiant FOREIGN KEY (fk_estudiante_id) REFERENCES Estudiante(id),
    ADD CONSTRAINT FK_Asistencia_Curso FOREIGN KEY (fk_curso_id) REFERENCES Curso(id);

ALTER TABLE Profesores
    ADD CONSTRAINT FK_Profesores_Departamento FOREIGN KEY (fk_departamento_id) REFERENCES Curso(id)

ALTER TABLE Estudiante
    ADD CONSTRAINT FK_Estudiante_Pariente FOREIGN KEY (pariente_id) REFERENCES Pariente(id);

ALTER TABLE Departamento 
    ADD CONSTRAINT FK_Facultad_Departamento FOREIGN KEY (fk_Facultad_id) REFERENCES Facultad(id);

ALTER TABLE Curso
    ADD CONSTRAINT FK_Curso_Departamento FOREIGN KEY (fk_departament_id) REFERENCES Departamento(id),
    ADD CONSTRAINT FK_Curso_Profesor FOREIGN KEY (fk_profesor_id) REFERENCES Profesores(id);

ALTER TABLE Examen
    ADD CONSTRAINT FK_Examen_Estudiante FOREIGN KEY (fk_estudiante_id) REFERENCES Estudiante(id),
    ADD CONSTRAINT FK_Examen_Curso FOREIGN KEY (fk_curso_id) REFERENCES Curso(id);

ALTER TABLE Session_Academica
    ADD CONSTRAINT FK_SessAcad_Estudiante FOREIGN KEY (fk_estudiante_id) REFERENCES Estudiante(id),
    ADD CONSTRAINT FK_SessAcad_Departamento FOREIGN KEY (fk_departamento_id) REFERENCES Departamento(id);

-- Insercion de Datos

-- Facultad
INSERT INTO Facultad VALUES 
(1,'Ciencias e ingienerias','3202818465','Edificio A'),
(2, 'Artes y humanidades', '3202832465', 'Edificio B'),
(3, 'Ciencias de la salud', '3202818466', 'Edificio C'),
(4, 'Ciencias económicas ', '320281823', 'Edificio D'),
(5, 'Ciencias sociales', '549839', 'Edificio E');

-- Depatamento
INSERT INTO Departamento VALUES 
(1,'Ingieneria Sistemas',1,'Ofc. 302','sistemas@edu.co','3208489'),
(2, 'Emprendiminto ', 4, 'Ofc. 203','emprree@edu.co','89798'),
(3, 'Ingeniería Mecánica', 1, 'Ofc. 304','mecani@edu.co','897123'),
(4, 'Ingeniería Industrial', 1, 'Ofc. 305','industria@edu.co','065894'),
(5, 'Ingeniería Química', 1, 'Ofc. 306','quimica@edu.co','9638574');

INSERT INTO Profesores VALUES
(100651,'Felipe','Rueda',1,'feliperueda@universidad.edu.co','+57319884','calle 1 #1-1'),
(100652, 'Laura', 'González', 2, 'lauragonzalez@universidad.edu.co', '+57319777', 'calle 2 #2-2'),
(100653, 'Carlos', 'Pérez', 3, 'carlosperez@universidad.edu.co', '+57319666', 'calle 3 #3-3'),
(100654, 'María', 'López', 4, 'marialopez@universidad.edu.co', '+57319555', 'calle 4 #4-4'),
(100655, 'Andrés', 'Martínez', 5, 'andresmartinez@universidad.edu.co', '+57319444', 'calle 5 #5-5');

INSERT INTO Pariente VALUES
(1225689741,'Johan Sebastian','Pachon Mojica','3214845641','jspachonm@ret.com'),
(1225689721, 'Andrea', 'Gómez Mojica', '3204845641', 'andgomez@ret.com'),
(1225689761, 'Camilo', 'Pachon García', '3224845641', 'campachon@ret.com'),
(1225689781, 'María', 'Mojica García', '3234845641', 'mariamojica@ret.com'),
(1225689742, 'Andrés', 'Pachon Gómez', '3244845641', 'andpachon@ret.com');

INSERT INTO Estudiante VALUES
(51241,'Pedro','Jimenez','2001-07-12',1225689741,'pedro@departamento.edu.co'),
(1312312, 'Pedro', 'Jimenez', '2001-07-12', 1225689721, 'pedr@departamento.edu.co'),
(1312313, 'Maria', 'Lopez', '2000-05-15', 1225689761, 'maria@departamento.edu.co'),
(1312314, 'Juan', 'Garcia', '1999-10-20', 1225689781, 'juan@departamento.edu.co'),
(1312315, 'Ana', 'Perez', '2002-01-05', 1225689742, 'ana@departamento.edu.co');

INSERT INTO Curso VALUES
(1,'Algebra Superior','2023-02-7','2023-07-01',40,1,100651),
(2, 'Gestion', '2023-03-10', '2023-07-15', 40, 2, 100652),
(3, 'Hidraulicos', '2023-03-10', '2023-07-15', 20, 3, 100653),
(4, 'Micro-Producion', '2023-03-10', '2023-07-15', 35, 4, 100654),
(5, 'Patogenos', '2023-03-10', '2023-07-15', 35, 5, 100655);
INSERT INTO Session_Academica VALUES
(1,'Mañana','2023-02-8',51241,1,'Pasi-Salvo'),
(2,'Tarde','2023-02-8',1312312,2,'Pasi-Salvo'),
(3,'Noche','2023-02-8',1312313,2,'Pasi-Salvo'),
(4,'Noche','2023-02-8',1312314,1,'Pasi-Salvo'),
(5,'Mañana','2023-07-10',1312315,2,'Pendiente');

INSERT INTO Examen VALUES
(1,'2023-06-28','4.5','Aprobado',51241,1),
(2,'2023-06-28','3.0','Aprobado',1312312,2),
(3,'2023-06-28','3.9','Aprobado',1312313,3),
(4,'2023-06-28','5.0','Aprobado',1312314,4),
(5,'2023-06-28','4.9','Aprobado',1312315,5);


USE institution;


-- Consultas
SELECT * FROM Session_Academica;
-- Estudiante que esten Pasi Salvo con su id y fecha de inico
SELECT tipo_session as Jornada,fecha_session as Inicio de la Session, fk_estudiante_id as Estudiante,
IF(estado='Pendiente','No cumple','Bien')
FROM Session_Academica as Sec
    WHERE Sec.estado NOT IN('Pendiente'); 

-- Estudiantes que terminaron las session por jornadas.
SELECT tipo_session as Jornada, COUNT(tipo_session) as Estudiantes FROM Session_Academica GROUP BY tipo_session;