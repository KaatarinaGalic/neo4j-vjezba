# Neo4j vježba

## Opis projekta

Ovaj projekt prikazuje rad s Neo4j graf bazom podataka i Cypher query jezikom kroz praktične zadatke. Cilj je bio kreirati čvorove i relacije, izvršavati različite vrste upita te raditi pretragu i analizu podataka unutar grafa.

---

## Pokretanje projekta

Pokrenuti Neo4j:

```bash
docker compose up -d
```

Provjera pokrenutih kontejnera:

```bash
docker compose ps
```

Kontejner mora imati status `running`.

---

## Servisi

Neo4j Browser:  
http://localhost:7474

Bolt port:  
localhost:7687

---

## Prijava

```text
Username: neo4j
Password: vjezba2026
```

---

## Sadržaj repozitorija

- `docker-compose.yml` → konfiguracija Neo4j okruženja
- `queries.cypher` → svi Cypher upiti korišteni tijekom vježbe
- `screenshots/` → screenshotovi izvršavanja zadataka
- `ODGOVORI.md` → teorijski odgovori
- `README.md` → opis projekta

---

## Funkcionalnosti

- kreiranje čvorova i relacija
- MATCH i WHERE upiti
- filtriranje podataka
- shortestPath i traversali
- agregacije i sortiranje
- rad s indeksima
- vizualizacija grafa u Neo4j Browseru

---

## Napomena

Projekt je rađen postepeno kroz više commitova u Visual Studio Code okruženju.