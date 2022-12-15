-- Ejercicio No. 1:¿Cuántos ríos fluyen a través de cada país que tiene más de 15 ríos?
SELECT COUNT(river) AS numero_rios, country
    FROM (
        -- rios y pais sin filas repetidas(quitando la provincia)
        SELECT river, country FROM geo_river GROUP BY river, country
    ) AS river_country GROUP BY country HAVING COUNT(river) > 15;

-- Ejercicio No. 2. Obtenga el nombre de los países que pertenecen o son miembros de la UNESCO o de UNASUR.
