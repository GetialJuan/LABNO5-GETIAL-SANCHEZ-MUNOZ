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

-- Ejercicio No. 3: ¿Cuál es el nombre, población y altitud de cada ciudad en Colombia (según lo registrado en
-- la base de datos)? Los resultados deben estar ordenados de manera descendente por población.
SELECT citypops.city, citypops.population, elevation FROM (
    SELECT city, MAX(year) AS año_mas_reciente FROM citypops WHERE  country = 'CO' GROUP BY city
) AS max_year_city 
    JOIN citypops ON max_year_city.año_mas_reciente = citypops.year 
        AND max_year_city.city = citypops.city AND citypops.country = 'CO'
    JOIN city ON citypops.city = city.name AND city.country = 'CO'
    ORDER BY population DESC;

-- Ejercicio No. 4: Obtenga los códigos de todos los países para los cuales (a) el PIB está compuesto al menos
-- en un 70% por los sectores de Servicios e Industria juntos, o (b) la inflación es inferior al 2%.
SELECT country FROM economy 
WHERE service + industry >= 70 OR inflation < 2;