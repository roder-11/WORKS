CREATE TABLE statistique(
	Entity TEXT,
	Code TEXT,
	Year integer,
	"Terrorist attacks" integer
);

SELECT * FROM statistique;

-- Quel est le pays qui a subit plus d'attaque ?

SELECT entity AS Pays , year AS Année_Attaque, MAX("Terrorist attacks")
FROM statistique
WHERE entity != 'World'
GROUP BY Pays, Année_Attaque
ORDER BY MAX("Terrorist attacks") DESC
LIMIT 5;