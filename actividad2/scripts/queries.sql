-- Ejercicio No. 1:¿Cuántos ríos fluyen a través de cada país que tiene más de 15 ríos?
SELECT COUNT(river) AS numero_rios, name
    FROM (
        -- rios y pais sin filas repetidas(quitando la provincia)
        SELECT river, country FROM geo_river GROUP BY river, country
    ) AS river_country JOIN country ON river_country.country = country.code
    GROUP BY name HAVING COUNT(river) > 15;

-- Ejercicio No. 2. Obtenga el nombre de los países que pertenecen o son miembros de la UNESCO o de UNASUR.
SELECT name FROM (
    SELECT country FROM ismember WHERE organization = 'UNESCO' OR organization = 'UNASUR'
) AS country_unesco_unasur JOIN country ON country_unesco_unasur.country = country.code;