-- Présentation de la table des données :

Select* from configuration;

-- Modification du type de données sur nb_places (de 'Text' à 'Integer'):

ALTER TABLE "configuration" ALTER COLUMN "nb_places" TYPE integer USING "nb_places":: integer;

-- Donner les différents type d'avion,le nombre de places, et le constructeur:

SELECT type_avion,nb_places,constructeur
FROM configuration
GROUP BY type_avion,nb_places,constructeur
ORDER BY nb_places DESC;

-- Donner le Nombre d'avion par type, et constructeur:

SELECT type_avion, COUNT(type_avion) AS Nbre_Total_avion_construits, constructeur
FROM configuration
GROUP BY type_avion, constructeur
ORDER BY Nbre_Total_avion_construits DESC;

-- Donner le nombre d'avion construit par chaque constructeur.

SELECT constructeur, count(type_avion) AS Nbre_avion_construit, nb_places
FROM configuration
GROUP BY constructeur, nb_places
ORDER BY Nbre_avion_construit DESC;

-- Donner les noms des constructeurs de ces différents objets et l'adresse(nom,N° Téléphone) de leur Technicien: 
-- 'Tableau de bord','Moteur','Air conditionné','Ventilation','Eclairage','Mise à jour auto-pilote'

SELECT objet, constructeur, duree ,prenom_mecanicien, telephone_mecanicien
FROM configuration
WHERE objet IN ('Tableau de bord','Moteur','Air conditionné','Ventilation','Eclairage','Mise à jour auto-pilote')
GROUP BY objet, constructeur, duree,prenom_mecanicien, telephone_mecanicien
ORDER BY duree DESC;

-- Quels sont les 5 types_d'avion qui prennent le plus de temps d'assemblage
-- Types d'objets à assembler
-- Nombre de place des types_d'avion.

SELECT type_avion,duree,objet,nb_places
FROM configuration
GROUP BY type_avion,duree,objet,nb_places
ORDER BY duree DESC
LIMIT 5;

-- Quels sont les 5 types_d'avion qui prennent moins de temps d'assemblage
-- Types d'objets à assembler
-- Nombre de place des types_d'avion.

SELECT type_avion,duree,objet,nb_places
FROM configuration
GROUP BY type_avion,duree,objet,nb_places
ORDER BY duree ASC
LIMIT 5;
