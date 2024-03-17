CREATE TABLE EMOTIONS(
	name TEXT,
	Genre TEXT,
	Star TEXT,
	rating TEXT,
	Director TEXT,
	Writer TEXT,
	Company TEXT,
	Country_Of_Released TEXT,
	Country_of_Product TEXT,
	Daily_Name TEXT,
	Months TEXT,
	Days INTEGER,
	Years INTEGER,
	Positive_reaction INTEGER,
	Neutral_reaction INTEGER,
	Negative_reaction INTEGER,
	favorability NUMERIC,
	Gross INTEGER,
	Budget INTEGER,
	votes INTEGER,
	trailer_link TEXT,
	video_id TEXT
);

SELECT * from emotions;

-- 1) Quel est le nombre de films produits par Mois ?

-- 2) Quel est le nombre de films produits par Genre ?

-- 3) Quels sont les 10 films ayant eût le plus de vote,et de réactions positives:
-- (Année de Sotie, Acteur, Directeur de production, Compagnie)?

-- 4) Quels sont les 10 films ayant eût le plus de vote,  et de réactions négative:


-- 5) Quelles sont les 10 Stars ayant joué le plus de films ?

-- 6) Quels sont 10 Directeurs (Ajouter le nom de l'Ecrivains du film ) ayant produit le plus de films ? 

-- 7) Quels sont les 10 compagnies ayant réalisées le plus de films ?

-- 8) Quel est le budget: * Total, * Maximal, * Moyen, * Minimum
-- pour la production d'un film ? Nb: Le calcul se fera sur "le budget net" et non sur "le budget brute"

-- 9) Quel est le film ayant le PLUS GRAND BUDGET alloué à sa production,
-- et quel est son "nombre de vote", et de "réaction positive", et de "reaction negative" ?

-- 10) Quel est le film ayant le PLUS PETIT BUDGET alloué à sa production,
-- et quel est son "nombre de vote", "de réaction positive", et de "reaction negative" ?

-- CORRECTION



-- 1) Quel est le nombre de films produits par Mois ?

SELECT months, COUNT(name) AS Nbre_Films_par_Mois
from emotions
GROUP BY months
ORDER BY Nbre_Films_par_Mois DESC
;

-- 2) Quel est le nombre de films produits par Genre ?

SELECT Genre, COUNT(genre) AS Nbre_Films_par_Genre
FROM emotions
GROUP BY Genre
ORDER BY Nbre_Films_par_Genre DESC;

-- 3) Quels sont les 10 films ayant eût le plus de vote,et de réactions positives:
-- (Année de Sotie, Acteur)?

SELECT name,years,star,MAX(votes) AS Plus_de_Votes,positive_reaction
FROM emotions
GROUP BY name,years,star,positive_reaction
ORDER BY positive_reaction DESC
LIMIT 10;

-- Petite parenthèse, le nombre de vote implique t-il un nombre réaction positive considérable ?


SELECT name,years,star,MAX(votes) AS plus_de_votes,positive_reaction
FROM emotions
GROUP BY name,years,star,positive_reaction
ORDER BY plus_de_votes DESC
LIMIT 10;


-- 4) Quels sont les 10 films ayant eût le plus de vote,  et de réactions négative:

SELECT name,years,star,MAX(votes) AS plus_de_votes,MAX(negative_reaction) AS negative_reaction
FROM emotions
GROUP BY name, years,star,negative_reaction
ORDER BY negative_reaction DESC 
LIMIT 10;

-- 5) Quelles sont les 10 Stars ayant joué le plus de films ?

SELECT star AS Acteur, COUNT(star) AS Nbre_Films_joués
FROM emotions
GROUP BY Acteur
ORDER BY Nbre_Films_joués DESC
LIMIT 10;

-- Films joués par Will Ferrell

SELECT star AS ACTEUR, name AS nom_du_Film, years AS Année_de_Sortie,positive_reaction,negative_reaction
FROM emotions
WHERE star = 'Will Ferrell'
ORDER BY positive_reaction DESC;

-- 6) Quels sont 10 Directeurs (Ajouter le nom de l'Ecrivains du film ) ayant produit le plus de films ? 

SELECT director, Count(name) AS Nbre_de_films_produits
FROM emotions
GROUP BY director
ORDER BY Nbre_de_films_produits DESC
limit 10;


-- 7) Quels sont les 10 compagnies ayant réalisées le plus de films ?

SELECT company, Count(name) AS Nbre_films_par_compagnie
FROM emotions
GROUP BY company
ORDER BY Nbre_films_par_compagnie DESC
limit 10;

-- 8) Quel est le budget: * Total, * Maximal, * Moyen, * Minimum
-- pour la production des films ? Nb: Le calcul se fera sur "le budget net" et non sur "le budget brute"

SELECT SUM(budget) AS Budget_Total_des_Films, MAX(budget) AS budget_Max_des_Films,
ROUND(AVG(budget),2) AS budget_Moyen_des_Films, MIN(budget) AS budget_Min_des_Films
FROM emotions
WHERE budget != 0;


-- 9) Quel est le film ayant le PLUS GRAND BUDGET alloué à sa production,
-- et quel est son "nombre de vote", et de "réaction positive"?

SELECT genre,name,years AS Année_de_sortie,star AS Acteur,country_of_released AS Pays_de_réalisation,
MAX(budget) AS Plus_Grand_Budget,votes,positive_reaction
FROM emotions
GROUP BY genre,name,Année_de_sortie,Acteur,Pays_de_réalisation,votes,positive_reaction
ORDER BY Plus_Grand_Budget DESC 
LIMIT 1;



-- 10) Quel est le film ayant le PLUS PETIT BUDGET alloué à sa production,
-- et quel est son "nombre de vote", "de réaction positive" ?

SELECT genre,name,years AS Année_de_sortie,star AS Acteur,country_of_released AS Pays_de_réalisation,
MIN(budget) AS Plus_petit_Budget,votes,positive_reaction
FROM emotions
WHERE budget != 0
GROUP BY genre,name,Année_de_sortie,Acteur,Pays_de_réalisation,votes,positive_reaction
ORDER BY Plus_petit_Budget ASC 
LIMIT 1;

-- Quel est le film ayant le PLUS DE REACTION POSITIVE ET QUEL BUDGET alloué à sa production

SELECT genre,name,years AS Année_de_sortie,star AS Acteur,country_of_released AS Pays_de_réalisation,
budget,votes,MAX(positive_reaction) AS Plus_reaction_positive_Budget
FROM emotions
GROUP BY genre,name,Année_de_sortie,Acteur,Pays_de_réalisation,budget,votes
ORDER BY Plus_reaction_positive_Budget DESC 
LIMIT 1;