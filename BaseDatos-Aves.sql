DROP DATABASE IF EXISTS Trabajo;
CREATE DATABASE Trabajo CHARACTER SET utf8mb4;
USE TRABAJO;

CREATE TABLE aves (
  id INT AUTO_INCREMENT PRIMARY KEY,
  familia VARCHAR(50) NOT NULL,
  nombre_comun VARCHAR(50),
  nombre_cientifico VARCHAR(50) DEFAULT NULL
);
CREATE TABLE reproduccion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_ave INT NOT NULL,
    FOREIGN KEY (id_ave) REFERENCES aves(id) ON UPDATE RESTRICT,
    fecha_puesta DATE NOT NULL,
    numero_huevos INT NOT NULL,
    fecha_eclosion DATE,
    numero_polluelos INT,
    observaciones TEXT
);
CREATE TABLE observaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    ubicacion VARCHAR(255) NOT NULL,
    id_ave INT NOT NULL,
    condiciones_climaticas VARCHAR(100),
    observador VARCHAR(100),
    notas TEXT,
    FOREIGN KEY (id_ave) REFERENCES aves(id) ON DELETE CASCADE ON UPDATE RESTRICT
);
CREATE TABLE migracion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_ave INT NOT NULL,
    FOREIGN KEY (id_ave) REFERENCES aves(id) ON DELETE RESTRICT,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    ruta_migratoria VARCHAR(255),
    distancia_recorrida DECIMAL(10,2),
    observaciones TEXT
);
CREATE TABLE alimentacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_ave INT NOT NULL,
    FOREIGN KEY (id_ave) REFERENCES aves(id),
    fecha DATE NOT NULL,
    presa VARCHAR(100) NOT NULL,
    cantidad DECIMAL(10,2) NOT NULL,
    ubicacion VARCHAR(255),
    observaciones TEXT
);
CREATE TABLE morfologia (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_ave INT NOT NULL,
    FOREIGN KEY (id_ave) REFERENCES aves(id),
    longitud_alas DECIMAL(10,2) NOT NULL,
    envergadura DECIMAL(10,2) NOT NULL,
    longitud_cola DECIMAL(10,2),
    peso DECIMAL(10,2),
    observaciones TEXT
);
CREATE TABLE estado (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_ave INT NOT NULL,
    FOREIGN KEY (id_ave) REFERENCES aves(id),
    estado_conservacion VARCHAR(50) NOT NULL,
    poblacion_estimada INT,
    ultimo_censo DATE,
    amenazas TEXT,
    medidas_conservacion TEXT
);
-- Insertar datos en la tabla de aves
INSERT INTO aves (familia, nombre_comun, nombre_cientifico) VALUES
('Accipitridae', 'Águila imperial oriental', 'Aquila heliaca'),
('Accipitridae', 'Águila imperial ibérica', 'Aquila adalberti'),
('Strigidae', 'Búho nival', 'Bubo scandiacus'),
('Sagittariidae', 'Secretario', 'Sagittarius serpentarius'),
('Falconidae', 'Halcón de eleonor', 'Falco eleonorae'),
('Accipitridae', 'Pigargo vocinglero', 'Haliaeetus vocifer'),
('Falconidae', 'Halcón maorí', 'Falco novaeseelandiae'),
('Accipitridae', 'Águila azor perdicera', 'Aquila fasciata'),
('Strigidae', 'Búho corniblanco', 'Lophostrix cristata'),
('Falconidae', 'Halcón mexicano o halcón pálido', 'Falco mexicanus'),
('Strigidae', 'Mochuelo de Blewitt', 'Athene blewitti / Heteroglaux blewitti'),
('Falconidae', 'Alcotán europeo', 'Falco subbuteo'),
('Cathartidae', 'Cóndor real', 'Sarcoramphus papa'),
('Strigidae', 'Búho manchado', 'Strix occidentalis'),
('Accipitridae', 'Águila rapaz', 'Aquila rapax'),
('Strigidae', 'Búho chico', 'Asio otus'),
('Strigidae', 'Mochuelo costarricense', 'Glaucidium costaricanum'),
('Falconidae', 'Gerifalte o halcón gerifalte', 'Falco rusticolus'),
('Strigidae', 'Búho del desierto', 'Bubo ascalaphus'),
('Accipitridae', 'Águila cafre', 'Aquila verreauxii'),
('Falconidae', 'Esmerejón', 'Falco columbarius'),
('Strigidae', 'Lechuzón orejudo', 'Asio o Pseudoscops clamator'),
('Strigidae', 'Mochuelo de madriguera', 'Athene cunicularia'),
('Falconidae', 'Cernícalo ojiblanco', 'Falco rupicoloides'),
('Falconidae', 'Alcotán oriental', 'Falco severus'),
('Strigidae', 'Autillo guatemalteco', 'Megascops guatemalae'),
('Falconidae', 'Halcón sacre', 'Falco cherrug'),
('Falconidae', 'Halcón pechirrojo o halcón negro grande', 'Falco deiroleucus'),
('Strigidae', 'Mochuelo de jungla', 'Glaucidium radiatum'),
('Strigidae', 'Búho cornudo o búho real americano', 'Bubo virginianus'),
('Falconidae', 'Halcón tagarote', 'Falco pelegrinoides');

INSERT INTO reproduccion (id_ave, fecha_puesta, numero_huevos, fecha_eclosion, numero_polluelos, observaciones) VALUES
(1, '2024-04-20', 2, '2024-05-10', 2, 'Eclosión exitosa'),
(2, '2024-04-25', 3, NULL, NULL, 'Huevos bajo observación'),
(3, '2024-04-18', 4, '2024-05-08', 4, 'Eclosión completa'),
(4, '2024-04-22', 1, NULL, NULL, 'Incubación en curso'),
(5, '2024-04-27', 2, NULL, NULL, 'Huevos recién puestos'),
(6, '2024-04-20', 3, '2024-05-12', 3, 'Eclosión completa'),
(7, '2024-04-22', 2, NULL, NULL, 'Incubación en curso'),
(8, '2024-04-25', 4, '2024-05-10', 4, 'Eclosión exitosa'),
(9, '2024-04-28', 2, NULL, NULL, 'Huevos bajo observación'),
(10, '2024-05-01', 3, '2024-05-17', 2, 'Eclosión parcial'),
(11, '2024-04-24', 200, NULL, NULL, 'Incubación normal'),
(12, '2024-04-27', 3, NULL, NULL, 'Huevos recién puestos'),
(13, '2024-04-22', 3, NULL, NULL, 'Huevos bajo observación'),
(14, '2024-04-24', 2, NULL, NULL, 'Incubación en curso'),
(15, '2024-04-26', 4, '2024-05-08', 3, 'Eclosión parcial'),
(16, '2024-04-28', 2, NULL, NULL, 'Incubación normal'),
(17, '2024-04-30', 3, '2024-05-10', 2, 'Eclosión exitosa'),
(18, '2024-05-02', 3, NULL, NULL, 'Huevos bajo observación'),
(19, '2024-04-25', 2, '2024-05-07', 2, 'Eclosión completa'),
(20, '2024-04-27', 3, NULL, NULL, 'Incubación en curso'),
(21, '2024-04-22', 4, NULL, NULL, 'Huevos bajo observación'),
(22, '2024-04-24', 3, '2024-05-06', 3, 'Eclosión completa'),
(23, '2024-04-26', 2, NULL, NULL, 'Incubación en curso'),
(24, '2024-04-28', 3, NULL, NULL, 'Huevos bajo observación'),
(25, '2024-04-30', 2, '2024-05-08', 2, 'Eclosión exitosa'),
(26, '2024-05-02', 3, NULL, NULL, 'Incubación normal'),
(27, '2024-04-25', 2, NULL, NULL, 'Incubación en curso'),
(28, '2024-04-27', 4, '2024-05-07', 4, 'Eclosión parcial'),
(29, '2024-04-29', 3, NULL, NULL, 'Huevos bajo observación'),
(30, '2024-05-01', 2, NULL, NULL, 'Incubación en curso');

-- Inserts para la tabla observaciones
INSERT INTO observaciones (fecha, ubicacion, id_ave, condiciones_climaticas, observador, notas) VALUES
('2024-04-25', 'Bosque', 1, 'Lluvioso', 'Carlos', 'Avistadas 2 águilas juveniles'),
('2024-04-28', 'Campo abierto', 2, 'Soleado', 'Ana', 'Observación de cortejo'),
('2024-05-01', 'Reserva natural', 3, 'Nublado', 'Pedro', 'Avistamiento de nido con polluelos'),
('2024-05-03', 'Parque nacional', 4, 'Ventoso', 'María', 'Nido vacío, posible eclosión próxima'),
('2024-05-05', 'Área urbana', 5, 'Despejado', 'Juan', 'Huevos aún en el nido'),
('2024-04-26', 'Bosque', 6, 'Lluvioso', 'Laura', 'Avistadas crías de águila'),
('2024-04-29', 'Acantilado', 7, 'Ventoso', 'Martín', 'Nido observado desde distancia segura'),
('2024-05-03', 'Reserva natural', 8, 'Nublado', 'Elena', 'Nido con actividad de alimentación'),
('2024-05-05', 'Parque nacional', 9, 'Soleado', 'Roberto', 'Avistamiento de hembra incubando'),
('2024-05-08', 'Bosque', 10, 'Despejado', 'Sofía', 'Nido con polluelos visibles'),
('2024-05-02', 'Río cercano', 11, 'Nublado', 'Diego', 'Hembra observada cazando'),
('2024-04-30', 'Área urbana', 12, 'Lluvioso', 'Carla', 'Huevos en nido bien protegidos'),
('2024-04-27', 'Zona pantanosa', 13, 'Lluvioso', 'María', 'Avistadas aves adultas cazando'),
('2024-04-29', 'Bosque denso', 14, 'Nublado', 'Carlos', 'Nido bien camuflado, difícil de observar'),
('2024-05-01', 'Montañas', 15, 'Despejado', 'Elena', 'Nido con polluelos visibles'),
('2024-05-03', 'Pradera', 16, 'Soleado', 'Juan', 'Huevos en nido bien protegidos'),
('2024-05-05', 'Río cercano', 17, 'Ventoso', 'Ana', 'Observación de actividad de alimentación'),
('2024-05-07', 'Acantilado', 18, 'Nublado', 'Pedro', 'Nido con actividad de incubación'),
('2024-05-09', 'Área urbana', 19, 'Despejado', 'Sofía', 'Avistamiento de crías de halcón'),
('2024-05-11', 'Bosque', 20, 'Lluvioso', 'Diego', 'Registro de actividad de cortejo'),
('2024-04-27', 'Reserva natural', 21, 'Despejado', 'Elena', 'Nido observado desde torre de vigilancia'),
('2024-04-29', 'Bosque denso', 22, 'Lluvioso', 'Carlos', 'Registro de actividad de cortejo'),
('2024-05-01', 'Montañas', 23, 'Nublado', 'Sofía', 'Avistamiento de hembra incubando'),
('2024-05-03', 'Pradera', 24, 'Despejado', 'Juan', 'Nido con actividad de alimentación'),
('2024-05-05', 'Río cercano', 25, 'Soleado', 'Laura', 'Huevos eclosionando'),
('2024-05-07', 'Acantilado', 26, 'Nublado', 'Diego', 'Observación de polluelos recién nacidos'),
('2024-05-09', 'Área urbana', 27, 'Lluvioso', 'María', 'Nido bien protegido de la lluvia'),
('2024-05-11', 'Bosque', 28, 'Despejado', 'Pedro', 'Registro de actividad de alimentación de los polluelos'),
('2024-05-13', 'Reserva natural', 29, 'Ventoso', 'Elena', 'Huevos en nido bien protegidos'),
('2024-05-15', 'Bosque denso', 30, 'Nublado', 'Carlos', 'Observación de incubación constante');

-- Inserts para la tabla migracion
INSERT INTO migracion (id_ave, fecha_inicio, fecha_fin, ruta_migratoria, distancia_recorrida, observaciones) VALUES
(1, '2023-09-15', '2024-04-10', 'Ruta del Este', 6000.50, 'Registro de avistamientos a lo largo de la ruta'),
(2, '2023-08-20', '2024-03-25', 'Ruta del Oeste', 5500.75, 'Observaciones de migración en áreas costeras'),
(3, '2023-10-05', '2024-05-01', 'Ruta del Sur', 7000.25, 'Avistamientos en zonas montañosas durante la migración'),
(4, '2023-09-30', '2024-04-15', 'Ruta del Norte', 6200.00, 'Seguimiento por satélite durante migración'),
(5, '2023-08-25', '2024-03-30', 'Ruta del Este', 5800.00, 'Registro de puntos de parada durante la migración'),
(6, '2023-09-18', '2024-04-13', 'Ruta del Norte', 5800.00, 'Seguimiento satelital durante migración'),
(7, '2023-09-22', '2024-04-18', 'Ruta del Este', 6200.50, 'Registro de avistamientos a lo largo de la ruta'),
(8, '2023-09-25', '2024-04-20', 'Ruta del Oeste', 5600.75, 'Observaciones en áreas costeras durante migración'),
(9, '2023-09-28', '2024-04-23', 'Ruta del Sur', 6000.25, 'Avistamientos en zonas montañosas durante migración'),
(10, '2023-09-30', '2024-04-25', 'Ruta del Este', 5900.00, 'Registro de puntos de parada durante la migración'),
(11, '2023-10-02', '2024-04-28', 'Ruta del Norte', 6100.00, 'Seguimiento por satélite durante migración'),
(12, '2023-10-05', '2024-05-01', 'Ruta del Oeste', 5700.00, 'Observaciones en áreas costeras durante migración'),
(13, '2023-09-20', '2024-04-15', 'Ruta del Este', 5500.00, 'Avistamientos a lo largo de la ruta migratoria'),
(14, '2023-09-22', '2024-04-18', 'Ruta del Oeste', 5700.50, 'Observaciones en áreas de descanso durante la migración'),
(15, '2023-09-25', '2024-04-20', 'Ruta del Sur', 6000.25, 'Seguimiento satelital durante migración'),
(16, '2023-09-28', '2024-04-23', 'Ruta del Norte', 6200.00, 'Registro de avistamientos a lo largo de la migración'),
(17, '2023-09-30', '2024-04-25', 'Ruta del Este', 5900.00, 'Observaciones de comportamiento migratorio en áreas costeras'),
(18, '2023-10-02', '2024-04-28', 'Ruta del Norte', 6100.00, 'Seguimiento por satélite durante migración'),
(19, '2023-10-05', '2024-05-01', 'Ruta del Oeste', 5700.00, 'Registro de puntos de parada durante la migración'),
(20, '2023-10-08', '2024-05-04', 'Ruta del Sur', 5900.00, 'Avistamientos en zonas montañosas durante migración'),
(21, '2023-09-20', '2024-04-15', 'Ruta del Este', 5800.00, 'Avistamientos a lo largo de la ruta migratoria'),
(22, '2023-09-22', '2024-04-18', 'Ruta del Oeste', 6000.50, 'Observaciones en áreas de descanso durante la migración'),
(23, '2023-09-25', '2024-04-20', 'Ruta del Sur', 6200.25, 'Seguimiento satelital durante migración'),
(24, '2023-09-28', '2024-04-23', 'Ruta del Norte', 6400.00, 'Registro de avistamientos a lo largo de la migración'),
(25, '2023-09-30', '2024-04-25', 'Ruta del Este', 6100.00, 'Observaciones de comportamiento migratorio en áreas costeras'),
(26, '2023-10-02', '2024-04-28', 'Ruta del Norte', 6300.00, 'Seguimiento por satélite durante migración'),
(27, '2023-10-05', '2024-05-01', 'Ruta del Oeste', 5900.00, 'Registro de puntos de parada durante la migración'),
(28, '2023-10-08', '2024-05-04', 'Ruta del Sur', 6100.00, 'Avistamientos en zonas montañosas durante migración'),
(29, '2023-10-10', '2024-05-07', 'Ruta del Este', 6000.00, 'Observaciones de migración en áreas costeras'),
(30, '2023-10-12', '2024-05-10', 'Ruta del Norte', 6200.00, 'Seguimiento satelital durante migración');

-- Inserts para la tabla alimentacion
INSERT INTO alimentacion (id_ave, fecha, presa, cantidad, ubicacion, observaciones) VALUES
(1, '2024-04-23', 'Conejo', 0.5, 'Bosque', 'Águila adulta cazando presa'),
(2, '2024-04-26', 'Rata', 0.3, 'Campo abierto', 'Caza exitosa de ratón'),
(3, '2024-04-29', 'Lagarto', 0.4, 'Reserva natural', 'Caza de reptiles en zona rocosa'),
(4, '2024-05-02', 'Rata', 0.2, 'Parque nacional', 'Hembra alimentando durante la incubación'),
(5, '2024-05-04', 'Pez', 0.6, 'Río cercano', 'Hembra cazando peces para alimentar huevos'),
(6, '2024-04-25', 'Conejo', 0.6, 'Bosque', 'Cría cazando presa por primera vez'),
(7, '2024-04-28', 'Cabra', 0.8, 'Acantilado', 'Registro de actividad de carroñero'),
(8, '2024-05-01', 'Pez', 1.2, 'Río cercano', 'Hembra cazando peces para alimentar polluelos'),
(9, '2024-05-04', 'Roedor', 0.4, 'Reserva natural', 'Registro de actividad de caza en terreno boscoso'),
(10, '2024-05-07', 'Serpiente', 0.5, 'Parque nacional', 'Caza de reptiles en zona rocosa'),
(11, '2024-05-10', 'Rata', 0.3, 'Área urbana', 'Hembra cazando presa en entorno urbano'),
(12, '2024-05-03', 'Insecto', 0.2, 'Bosque', 'Alimentación de la hembra durante la incubación'),
(13, '2024-04-26', 'Roedor', 0.4, 'Zona pantanosa', 'Registro de actividad de caza'),
(14, '2024-04-28', 'Lagarto', 0.5, 'Bosque denso', 'Observación de caza de reptiles'),
(15, '2024-05-01', 'Pez', 0.8, 'Río cercano', 'Registro de actividad de caza acuática'),
(16, '2024-05-03', 'Rata', 0.3, 'Pradera', 'Observación de caza de roedores'),
(17, '2024-05-05', 'Pájaro', 0.6, 'Río cercano', 'Registro de actividad de caza aérea'),
(18, '2024-05-07', 'Conejo', 0.7, 'Acantilado', 'Observación de caza en terreno escarpado'),
(19, '2024-05-09', 'Rata', 0.4, 'Área urbana', 'Registro de actividad de caza en entorno urbano'),
(20, '2024-05-11', 'Insecto', 0.2, 'Bosque', 'Observación de alimentación durante cortejo'),
(21, '2024-04-26', 'Roedor', 0.4, 'Reserva natural', 'Registro de actividad de caza'),
(22, '2024-04-28', 'Lagarto', 0.5, 'Bosque denso', 'Observación de caza de reptiles'),
(23, '2024-05-01', 'Pez', 0.8, 'Río cercano', 'Registro de actividad de caza acuática'),
(24, '2024-05-03', 'Rata', 0.3, 'Pradera', 'Observación de caza de roedores'),
(25, '2024-05-05', 'Pájaro', 0.6, 'Río cercano', 'Registro de actividad de caza aérea'),
(26, '2024-05-07', 'Conejo', 0.7, 'Acantilado', 'Observación de caza en terreno escarpado'),
(27, '2024-05-09', 'Rata', 0.4, 'Área urbana', 'Registro de actividad de caza en entorno urbano'),
(28, '2024-05-11', 'Insecto', 0.2, 'Bosque', 'Observación de alimentación durante cortejo'),
(29, '2024-05-13', 'Roedor', 0.5, 'Reserva natural', 'Registro de actividad de caza'),
(30, '2024-05-15', 'Lagarto', 0.3, 'Bosque denso', 'Observación de caza de reptiles');

-- Inserts para la tabla morfologia
INSERT INTO morfologia (id_ave, longitud_alas, envergadura, longitud_cola, peso, observaciones) VALUES
(1, 85.5, 200.3, 35.7, 4.2, 'Mediciones tomadas durante revisión rutinaria'),
(2, 65.2, 150.0, 30.0, 3.1, 'Mediciones registradas durante control de salud'),
(3, 50.0, 120.5, NULL, 2.5, 'Mediciones aproximadas debido a agresividad del individuo'),
(4, 70.0, 160.0, 25.0, 3.5, 'Mediciones tomadas durante visita al nido'),
(5, 55.0, 130.0, NULL, 2.8, 'Mediciones registradas durante cortejo y alimentación'),
(6, 75.0, 180.0, 40.0, 4.0, 'Mediciones tomadas durante revisión rutinaria'),
(7, 40.0, 100.0, NULL, 1.8, 'Mediciones registradas durante control de salud'),
(8, 55.0, 130.0, NULL, 2.5, 'Mediciones tomadas durante visita al nido'),
(9, 60.0, 140.0, 30.0, 3.0, 'Mediciones aproximadas debido a agresividad del individuo'),
(10, 65.0, 150.0, NULL, 3.7, 'Mediciones tomadas durante revisión rutinaria'),
(11, 50.0, 120.0, NULL, 2.2, 'Mediciones registradas durante control de salud'),
(12, 45.0, 110.0, NULL, 2.0, 'Mediciones aproximadas debido a agresividad del individuo'),
(13, 55.0, 130.0, NULL, 2.8, 'Mediciones tomadas durante revisión rutinaria'),
(14, 45.0, 110.0, NULL, 2.3, 'Mediciones registradas durante control de salud'),
(15, 60.0, 140.0, 25.0, 3.2, 'Mediciones aproximadas debido a agresividad del individuo'),
(16, 50.0, 120.0, NULL, 2.5, 'Mediciones tomadas durante visita al nido'),
(17, 70.0, 160.0, 30.0, 3.8, 'Mediciones registradas durante cortejo y alimentación'),
(18, 65.0, 150.0, NULL, 3.5, 'Mediciones tomadas durante revisión rutinaria'),
(19, 52.0, 125.0, NULL, 2.6, 'Mediciones registradas durante control de salud'),
(20, 48.0, 115.0, NULL, 2.4, 'Mediciones aproximadas debido a agresividad del individuo'),
(21, 60.0, 140.0, 25.0, 3.2, 'Mediciones aproximadas debido a agresividad del individuo'),
(22, 45.0, 110.0, NULL, 2.3, 'Mediciones registradas durante control de salud'),
(23, 50.0, 120.0, NULL, 2.5, 'Mediciones tomadas durante visita al nido'),
(24, 65.0, 150.0, NULL, 3.5, 'Mediciones tomadas durante revisión rutinaria'),
(25, 70.0, 160.0, 30.0, 3.8, 'Mediciones registradas durante cortejo y alimentación'),
(26, 55.0, 130.0, NULL, 2.8, 'Mediciones tomadas durante revisión rutinaria'),
(27, 52.0, 125.0, NULL, 2.6, 'Mediciones registradas durante control de salud'),
(28, 48.0, 115.0, NULL, 2.4, 'Mediciones aproximadas debido a agresividad del individuo'),
(29, 62.0, 145.0, NULL, 3.3, 'Mediciones tomadas durante visita al nido'),
(30, 58.0, 135.0, NULL, 3.0, 'Mediciones registradas durante cortejo y alimentación');

INSERT INTO estado (id_ave, estado_conservacion, poblacion_estimada, ultimo_censo, amenazas, medidas_conservacion) VALUES
(1, 'En peligro', 500, '2023-12-01', 'Pérdida de hábitat, caza ilegal', 'Creación de reservas, campañas de concienciación'),
(2, 'Vulnerable', 800, '2023-11-15', 'Contaminación, cambio climático', 'Regulaciones ambientales, monitoreo continuo'),
(3, 'Preocupación menor', 1500, '2023-10-20', 'Pérdida de hábitat', 'Protección de áreas de cría'),
(4, 'Casi amenazado', 1200, '2023-09-30', 'Pérdida de hábitat, caza ilegal', 'Monitoreo de poblaciones, protección de hábitat'),
(5, 'En peligro crítico', 200, '2023-08-25', 'Cambio climático, pérdida de hábitat', 'Cría en cautiverio, restauración de hábitats'),
(6, 'Preocupación menor', 3000, '2023-07-10', 'Pérdida de hábitat', 'Protección de hábitats, monitoreo de poblaciones'),
(7, 'Vulnerable', 700, '2023-06-15', 'Caza ilegal, pérdida de hábitat', 'Patrullas de vigilancia, creación de reservas'),
(8, 'En peligro', 400, '2023-05-20', 'Pérdida de hábitat, caza ilegal', 'Protección de áreas de cría, campañas de concienciación'),
(9, 'Preocupación menor', 2500, '2023-04-25', 'Pérdida de hábitat', 'Protección de hábitats'),
(10, 'Casi amenazado', 1000, '2023-03-30', 'Contaminación, cambio climático', 'Regulaciones ambientales, protección de hábitats');

DELIMITER //

CREATE PROCEDURE InsertarAve(
    IN familia VARCHAR(50),
    IN nombre_comun VARCHAR(50),
    IN nombre_cientifico VARCHAR(50),
    OUT nuevo_id INT
)
BEGIN
    INSERT INTO aves (familia, nombre_comun, nombre_cientifico)
    VALUES (familia, nombre_comun, nombre_cientifico);
    
    SET nuevo_id = LAST_INSERT_ID();
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION TotalHuevosPuestos() 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    
    SELECT SUM(numero_huevos) INTO total
    FROM reproduccion;
    
    RETURN total;
END //

DELIMITER ;
