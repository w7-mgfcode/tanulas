# Alaprendszer kiválasztása
FROM python:3.11-slim

# Munkakönyvtár beállítása
WORKDIR /backend

# Rendszerszintű függőségek telepítése
RUN apt-get update && apt-get install -y \
    && rm -rf /var/lib/apt/lists/*

# Python teszteléshez szükséges függőségek
COPY backend/requirements.txt .
COPY tests/requirements.txt tests-requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir -r tests-requirements.txt

# Projekt és teszt fájlok másolása
COPY backend/ .
COPY tests/ /tests/

# Futtatható parancs
CMD ["pytest", "/test"]