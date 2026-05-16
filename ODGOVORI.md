## Zadatak 1

Neo4j eksponira dva porta:

- 7474 --> HTTP port za Neo4j Browser web sučelje
- 7687 --> Bolt port za komunikaciju aplikacija s bazom

## Zadatak 2 CREATE vs MERGE

CREATE uvijek kreira novi čvor ili relaciju, čak i ako identični podaci već postoje u bazi.  
MERGE provjerava postoji li već takav čvor ili relacija, i ako postoji koristi ga, a ako ne postoji tada ga kreira.  
MERGE se koristi kako bi se izbjegli duplikati u grafu.