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