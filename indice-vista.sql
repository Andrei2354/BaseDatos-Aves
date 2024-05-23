-- Apartado 1
Alter Table `trabajo`.`aves` add index(nombre_comun);
Alter Table `trabajo`.`observaciones` add index(observador);
Alter Table `trabajo`.`alimentacion` add index(presa);

-- Apartado 2

CREATE VIEW contar_aves AS select count(id) as total_aves from aves;
CREATE VIEW tienen_polluelos AS select * from reproduccion where numero_polluelos > 0;
CREATE VIEW ruta_migratoria_sur AS select a.nombre_comun from aves a join migracion m on a.id=m.id_ave where ruta_migratoria = "Ruta del Sur";
CREATE VIEW familia_strigidae AS select id, nombre_comun from aves where familia = "Strigidae";
CREATE VIEW presa_conejo AS select a.nombre_comun from aves a join alimentacion al on a.id=al.id_ave where presa = "Conejo";