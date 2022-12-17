-- Ejercicio No. 1:¿Cuántos ríos fluyen a través de cada país que tiene más de 15 ríos?
SELECT COUNT(river) AS numero_rios, name
    FROM (
        -- rios y pais sin filas repetidas(quitando la provincia)
        SELECT river, country FROM geo_river GROUP BY river, country
    ) AS river_country JOIN country ON river_country.country = country.code
    GROUP BY name HAVING COUNT(river) > 15;

    -- Algebra Relacional
    /*
    σ numero_rios > 15 
	    (γ name; count(river) → numero_rios 
		    ((π river, country (geo_river)) 
			    ⨝ country = country.code (country)))
    */

-- Ejercicio No. 2. Obtenga el nombre de los países que pertenecen o son miembros de la UNESCO o de UNASUR.
SELECT name FROM (
    SELECT country FROM ismember WHERE organization = 'UNESCO' OR organization = 'UNASUR'
) AS country_unesco_unasur JOIN country ON country_unesco_unasur.country = country.code;

    -- Algebra Relacional
    /*
    π name 
	    ((σ organization = 'UNESCO' ∨ organization = 'UNASUR' (ismember))
		    ⨝ country = country.code (country))
    */

-- Ejercicio No. 3: ¿Cuál es el nombre, población y altitud de cada ciudad en Colombia (según lo registrado en
-- la base de datos)? Los resultados deben estar ordenados de manera descendente por población.
SELECT name, population, elevation FROM city WHERE country = 'CO' ORDER BY population DESC;

    -- Algebra Relacional
    /*
    τ population desc (
	    π name, population, elevation (
		    σ country = 'CO' (city)
	    )
    )
    */

-- Ejercicio No. 4: Obtenga los códigos de todos los países para los cuales (a) el PIB está compuesto al menos
-- en un 70% por los sectores de Servicios e Industria juntos, o (b) la inflación es inferior al 2%.
SELECT country FROM economy 
WHERE service + industry >= 70 OR inflation < 2;

    -- Algebra Relacional
    /*
    π country (
	    σ service + industry >= 70 ∨ inflation < 2 (economy)
    )
    */


--## (b) el número de registros en la respuesta ##
-- Para saber el numero de registros en cada respuesta solo se debe reemplazar la consulta("querie") realizada
-- segun el caso:

    -- SQL
        --- SELECT COUNT(*) FROM (querie);

    -- Algebra relacional
        -- γ count(*) → numero_de_registros (querie)
