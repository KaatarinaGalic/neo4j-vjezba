Zadatak 1
RETURN 'Neo4j radi!' AS poruka

Zadatak 2
// Filmovi
CREATE (f1:Film {naslov: 'Inception', godina: 2010, ocjena: 8.8, zanr: 'sci-fi'})
CREATE (f2:Film {naslov: 'The Dark Knight', godina: 2008, ocjena: 9.0, zanr: 'akcija'})
CREATE (f3:Film {naslov: 'Interstellar', godina: 2014, ocjena: 8.6, zanr: 'sci-fi'})
CREATE (f4:Film {naslov: 'Parasite', godina: 2019, ocjena: 8.6, zanr: 'triler'})
CREATE (f5:Film {naslov: 'The Godfather', godina: 1972, ocjena: 9.2, zanr: 'drama'})
CREATE (f6:Film {naslov: 'Memento', godina: 2000, ocjena: 8.4, zanr: 'triler'})

// Osobe
CREATE (o1:Osoba {ime: 'Christopher Nolan', dob: 54})
CREATE (o2:Osoba {ime: 'Bong Joon-ho', dob: 55})
CREATE (o3:Osoba {ime: 'Francis Ford Coppola', dob: 85})
CREATE (o4:Osoba {ime: 'Leonardo DiCaprio', dob: 50})
CREATE (o5:Osoba {ime: 'Christian Bale', dob: 50})

// Gradovi
CREATE (g1:Grad {naziv: 'Los Angeles'})
CREATE (g2:Grad {naziv: 'London'})
CREATE (g3:Grad {naziv: 'Seoul'})

PROVJERA
MATCH (n) RETURN count(n)

//Dodane dvije Osobe
CREATE (o6:Osoba {ime: 'Tom Hanks', dob: 68})
CREATE (o7:Osoba {ime: 'Emma Stone', dob: 36})

//Dodan Grad
CREATE (g4:Grad {naziv: 'New York'})

//Zadatak 3
//Korak 3 - VEZE

// REZIRAO
MATCH (o:Osoba {ime: 'Christopher Nolan'}), (f:Film {naslov: 'Inception'})
CREATE (o)-[:REZIRAO]->(f)

MATCH (o:Osoba {ime: 'Christopher Nolan'}), (f:Film {naslov: 'The Dark Knight'})
CREATE (o)-[:REZIRAO]->(f)

MATCH (o:Osoba {ime: 'Christopher Nolan'}), (f:Film {naslov: 'Interstellar'})
CREATE (o)-[:REZIRAO]->(f)

MATCH (o:Osoba {ime: 'Christopher Nolan'}), (f:Film {naslov: 'Memento'})
CREATE (o)-[:REZIRAO]->(f)

MATCH (o:Osoba {ime: 'Bong Joon-ho'}), (f:Film {naslov: 'Parasite'})
CREATE (o)-[:REZIRAO]->(f)

MATCH (o:Osoba {ime: 'Francis Ford Coppola'}), (f:Film {naslov: 'The Godfather'})
CREATE (o)-[:REZIRAO]->(f)


// GLUMIO_U
MATCH (o:Osoba {ime: 'Leonardo DiCaprio'}), (f:Film {naslov: 'Inception'})
CREATE (o)-[:GLUMIO_U]->(f)

MATCH (o:Osoba {ime: 'Christian Bale'}), (f:Film {naslov: 'The Dark Knight'})
CREATE (o)-[:GLUMIO_U]->(f)


// ZIVI_U
MATCH (o:Osoba {ime: 'Christopher Nolan'}), (g:Grad {naziv: 'London'})
CREATE (o)-[:ZIVI_U]->(g)

MATCH (o:Osoba {ime: 'Leonardo DiCaprio'}), (g:Grad {naziv: 'Los Angeles'})
CREATE (o)-[:ZIVI_U]->(g)

MATCH (o:Osoba {ime: 'Bong Joon-ho'}), (g:Grad {naziv: 'Seoul'})
CREATE (o)-[:ZIVI_U]->(g)


// PRIJATELJ
MATCH (a:Osoba {ime: 'Christopher Nolan'}), (b:Osoba {ime: 'Christian Bale'})
CREATE (a)-[:PRIJATELJ {od: 2000}]->(b)

MATCH (a:Osoba {ime: 'Leonardo DiCaprio'}), (b:Osoba {ime: 'Christopher Nolan'})
CREATE (a)-[:PRIJATELJ {od: 2010}]->(b)

//10. svi čvorovi i sve veze između njih
MATCH (n)-[r]->(m) RETURN n, r, m

//zadatak 11 dodane veze GLUMIO_U
MATCH (o:Osoba {ime: 'Tom Hanks'}), (f:Film {naslov: 'Inception'})
CREATE (o)-[:GLUMIO_U]->(f)

MATCH (o:Osoba {ime: 'Emma Stone'}), (f:Film {naslov: 'Parasite'})
CREATE (o)-[:GLUMIO_U]->(f)

// 12. provjera veza
MATCH ()-[r]->()
RETURN type(r) AS tip, count(*) AS broj
ORDER BY broj DESC

//Zadatak 4
//13. Filmovi žanra “triler”
MATCH (f:Film)
WHERE f.zanr = 'triler'
RETURN f.naslov, f.godina
ORDER BY f.godina ASC

//14.Redatelj i grad gdje živi
MATCH (o:Osoba)-[:ZIVI_U]->(g:Grad)
RETURN o.ime AS redatelj, g.naziv AS grad

//15.
MATCH (f:Film)
WHERE f.godina >= 2008 AND f.godina <= 2015
RETURN f.naslov, f.godina
ORDER BY f.godina

//16. Redatelji koji su snimili više od 1 filma
MATCH (o:Osoba)-[:REZIRAO]->(f:Film)
WITH o, count(f) AS broj_filmova
WHERE broj_filmova > 1
RETURN o.ime AS redatelj, broj_filmova
ORDER BY broj_filmova DESC

//Zadatak 5
//18.Najkraći put između Leonarda i Bong Joon-hoa

MATCH p = shortestPath(
  (a:Osoba {ime: 'Leonardo DiCaprio'})
  -[*1..5]-
  (b:Osoba {ime: 'Bong Joon-ho'})
)
RETURN p, length(p) AS duljina_puta

//19.Svi čvorovi udaljeni max 2 veze od Londona

MATCH (g:Grad {naziv: 'London'})-[*1..2]-(n)
RETURN DISTINCT n

//20.Jesu li Francis Ford Coppola i Leonardo povezani u max 4 koraka
MATCH (a:Osoba {ime: 'Francis Ford Coppola'})
MATCH (b:Osoba {ime: 'Leonardo DiCaprio'})

RETURN EXISTS {
  MATCH (a)-[*1..4]-(b)
} AS povezani

//Zadatak 6
//22.Ukupan broj filmova i prosječna ocjena
MATCH (f:Film)
RETURN count(f) AS broj_filmova,
       avg(f.ocjena) AS prosjecna_ocjena


//23. Broj filmova po žanru i maksimalna ocjena
MATCH (f:Film)
WITH f.zanr AS zanr,
     count(f) AS broj_filmova,
     max(f.ocjena) AS max_ocjena

RETURN zanr, broj_filmova, max_ocjena
ORDER BY broj_filmova DESC


//24. Osoba koja živi u gradu s najviše osoba
MATCH (o:Osoba)-[:ZIVI_U]->(g:Grad)

WITH g, count(o) AS broj_osoba
ORDER BY broj_osoba DESC
LIMIT 1

MATCH (osoba:Osoba)-[:ZIVI_U]->(g)

RETURN g.naziv AS grad,
       collect(osoba.ime) AS osobe,
       broj_osoba



//25.Lista glumaca za svaki film
MATCH (o:Osoba)-[:GLUMIO_U]->(f:Film)

RETURN f.naslov AS film,
       collect(o.ime) AS glumci
ORDER BY film