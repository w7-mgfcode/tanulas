# Projekt Dokumentáció

## Előfeltételek
- Docker
- Docker Compose
- Python 3.11+

## Projekt Struktúra
```
projekt/
├── backend/           # Backend forráskód
│   ├── main.py
│   └── requirements.txt
├── tests/             # Tesztek
│   └── requirements.txt
├── Dockerfile         # Backend Docker konfiguráció
├── Dockerfile.test    # Teszt Docker konfiguráció
└── docker compose.yml # Docker compose konfiguráció
```

## Telepítés és Első Lépések

### Fejlesztői Környezet Előkészítése
1. Klónozás
```bash
git clone <repository-url>
cd <projekt-mappa>
```

2. Docker Konténerek Felépítése
```bash
# Összes konténer felépítése
docker compose build

# Backend indítása
docker compose up backend
```

## Tesztelés

### Tesztek Futtatása
```bash
# Összes teszt futtatása
docker compose exec tests pytest /tests

# Specifikus teszt futtatása
docker compose exec tests pytest /tests/test_specifikus_modul.py

# Lefedettségi jelentés
docker compose exec tests pytest --cov=backend
```

## Fejlesztési Munkafolyamat

### Új Függőségek Hozzáadása
1. Backend függőségek: `backend/requirements.txt`
2. Teszt függőségek: `tests/requirements.txt`
3. Újraépítés: `docker compose build`

### Gyakori Parancsok
```bash
# Konténerek indítása
docker compose up -d

# Konténerek leállítása
docker compose down

# Naplók megtekintése
docker compose logs backend
docker compose logs tests
```

## Hibakeresés

### Belépés Konténerbe
```bash
# Backend konténer
docker compose exec backend /bin/bash

# Teszt konténer
docker compose exec tests /bin/bash
```

## Környezeti Változók
- Hozzon létre egy `.env` fájlt a projekt gyökerében
- Másolja a `.env.example` sablont (ha van)
- Módosítsa a szükséges beállításokat

## Fejlesztési Irányelvek
- Kövesse a Python PEP 8 stílusútmutatóját
- Írjon egységteszteket minden új funkcióhoz
- Tartsa naprakészen a `requirements.txt` fájlokat

## Telepítés Éles Környezetbe
1. Docker és Docker Compose telepítése a célszerveren
2. Projekt fájlok másolása
3. `docker compose up -d` parancs futtatása

## Hozzájárulás a Projekthez
1. Fork a repository-ról
2. Saját branch létrehozása
3. Változtatások végrehajtása
4. Pull request nyitása

## Licenc
[Adja meg a projekt licencét]

## Kapcsolat
[Projektgazda elérhetősége]