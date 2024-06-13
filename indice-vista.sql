Alter Table `trabajo`.`aves` add index(nombre_comun);
-- La finalidad de este índice es mostrar en nombre comun de cada ave.
Alter Table `trabajo`.`observaciones` add index(observador);
-- La finalidad de este índice es mostrar en nombre de los observadores.
Alter Table `trabajo`.`alimentacion` add index(presa);
-- La finalidad de este índice es mostrar las presas de cada ave

CREATE VIEW contar_aves AS select count(id) as total_aves from aves;
-- La finalidad de esta vista es mostrar el numero de aves que existen en la base de datos.

CREATE VIEW tienen_polluelos AS select * from reproduccion where numero_polluelos > 0;
-- La finalidad de esta vista es mostrar las aves que tienen polluelos.

CREATE VIEW ruta_migratoria_sur AS select a.nombre_comun from aves a join migracion m on a.id=m.id_ave where ruta_migratoria = "Ruta del Sur";
-- La finalidad de esta vista es mostrar el nombre de la aves que tienen la ruta migratoria del sur .

CREATE VIEW familia_strigidae AS select id, nombre_comun from aves where familia = "Strigidae";
-- La finalidad de esta vista es mostrar el id y el nombre de la aves de la familia Strigidae.

CREATE VIEW presa_cPRIMARYonejo AS select a.nombre_comun from aves a join alimentacion al on a.id=al.id_ave where presa = "Conejo";
-- La finalidad de esta vista es mostrar el nombre de las aves que se alimentan de Conejo.

DELETE FROM aves WHERE id = 1;
-- Esto fallará si hay alguna observación con id_ave = 1

UPDATE aves SET id = 3 WHERE id = 1;
-- Esto fallará si hay alguna observación con id_ave = 1

DELETE FROM reproduccion WHERE id = 2;
-- Esto eliminará automáticamente todas las observaciones con id_ave = 2


select * from aves;

SELECT TotalHuevosPuestos();

CALL InsertarAve('Falconidae', 'Halcón peregrino', 'Falco peregrinus', @nuevo_id);
SELECT @nuevo_id;


