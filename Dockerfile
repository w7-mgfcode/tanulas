# Base system
FROM python:3.11-slim

# Munkakönyvtár
WORKDIR /backend

# Rendszerszintű függőségek
    # Telepíti a Python csomagok fordításához és egyéb műveletekhez szükséges rendszerszintű függőségeket.
    # - apt-get update: Frissíti a csomaglistákat a tárolókból.
    # - apt-get install -y --no-install-recommends: Telepíti a csomagokat megerősítés kérése nélkül (-y)
    #   és az ajánlott (de nem szigorúan szükséges) csomagok nélkül (--no-install-recommends),
    #   hogy a image mérete kisebb maradjon.
    #   - gcc, build-essential: C/C++ fordítók és alapvető build eszközök, C/C++ kiterjesztések fordításához.
    #   - libpq-dev: PostgreSQL kliens könyvtár (libpq) fejlesztői fájljai (pl. psycopg2-höz).
    #   - libffi-dev: Foreign Function Interface könyvtár fejlesztői fájljai (pl. cffi-hez).
    #   - libssl-dev: OpenSSL fejlesztői fájljai (kriptográfia, biztonságos kapcsolatok).
    #   - curl: Parancssori eszköz URL-ekkel történő adatátvitelhez.
    #   - git: Verziókezelő rendszer (ha pl. Git repókból kell függőséget telepíteni).
    # - rm -rf /var/lib/apt/lists/*: Törli a letöltött csomaglistákat a telepítés után a méretcsökkentés érdekében.
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gcc \
    libpq-dev \
    libffi-dev \
    libssl-dev \
    build-essential \
    curl \
    git \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Python csomagok
COPY backend/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Projekt fájlok
COPY backend/ .

# Naplózás hozzáadása
RUN pip install --no-cache-dir logging

# Command
CMD ["python", "-c", "import logging; logging.basicConfig(level=logging.INFO); logging.info('Backend konténer elindult'); import time; time.sleep(float('inf'))"]

# Port
EXPOSE 9000