## Zadatak 1

Neo4j eksponira dva porta:

- 7474 --> HTTP port za Neo4j Browser web sučelje
- 7687 --> Bolt port za komunikaciju aplikacija s bazom

## Zadatak 2 CREATE vs MERGE

CREATE uvijek kreira novi čvor ili relaciju, čak i ako identični podaci već postoje u bazi.  
MERGE provjerava postoji li već takav čvor ili relacija, i ako postoji koristi ga, a ako ne postoji tada ga kreira.  
MERGE se koristi kako bi se izbjegli duplikati u grafu.

## Zadatak 4 MATCH vs OPTIONAL MATCH

MATCH vraća samo one rezultate koji imaju odgovarajuce čvorove i veze u grafu. Ako nešto ne postoji, rezultat se ne prikazuje.
OPTIONAL MATCH vraća sve rezultate iz glavnog uzorka, čak i ako povezani dio grafa ne postoji. U tom slučaju nedostajuće vrijednosti su null.
Na primjer: MATCH (o)-[:REZIRAO]->(f) vraća samo osobe koje su režirale filmove, dok OPTIONAL MATCH vraća sve osobe, uključujući i one bez filmova.

## Zadatak 5 shortestPath

Ako shortestPath ne pronađe put između dva čvora, upit ne vraća nijedan path rezultat.  
U tom slučaju vrijednost puta je NULL jer između čvorova ne postoji povezanost u grafu.

## Zavrsni
Neo4j bih koristila umjesto PostgreSQL-a u slučajevima kada su odnosi između podataka jednako važni kao i sami podaci, primjerice u glazbenim preporukama, društvenim mrežama ili recommendation sustavima. U takvim sustavima bitno je brzo pronalaženje povezanih izvođača, sličnih glazbenika i kolaboracija.
U relacijskom modelu ovakvi problemi zahtijevaju više JOIN operacija koje postaju kompleksne i spore kako raste broj tablica i veza. Posebno je teško efikasno rješavati probleme poput pronalaska najkraćih puteva ili “sličnosti” između izvođača.
U Neo4j graf modelu takvi upiti su prirodni jer su veze eksplicitno pohranjene i traversal kroz graf je vrlo brz. Najteže rješiv problem u relacijskom modelu bio bi recommendation sustav koji koristi više razina povezanosti (npr. izvođač --> suradnja --> slični izvođač --> žanr).