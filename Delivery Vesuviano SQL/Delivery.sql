CREATE TABLE TOKEN
(
  TOKEN_ID            INTEGER PRIMARY KEY,
  USER_ID             INTEGER,
  TOKEN_STRING        TEXT,
  CREATION_DATETIME   DATETIME DEFAULT CURRENT_TIMESTAMP,
  EXPIRATION_DURATION INTEGER,
  FOREIGN KEY (USER_ID) REFERENCES CLIENTE (ID_CLIENTE) ON DELETE CASCADE
);

CREATE TABLE RISTORANTE
(
  P_IVA_RISTORANTE           TEXT PRIMARY KEY,
  NOME_RISTORANTE            TEXT NOT NULL,
  NUMERO_TELEFONO_RISTORANTE TEXT,
  IMG_URL_RISTORANTE         TEXT
);

CREATE TABLE CLIENTE
(
  ID_CLIENTE       INTEGER PRIMARY KEY AUTOINCREMENT,
  NOME_CLIENTE     TEXT        NOT NULL,
  COGNOME_CLIENTE  TEXT        NOT NULL,
  EMAIL_CLIENTE    TEXT UNIQUE NOT NULL,
  PASSWORD_CLIENTE TEXT        NOT NULL,
  VIA_CLIENTE      TEXT        NOT NULL,
  CITTA_CLIENTE    TEXT        NOT NULL,
  CAP_CLIENTE      TEXT        NOT NULL,
  CITOFONO_CLIENTE TEXT        NOT NULL
);

CREATE TABLE MENU
(
  ID_PIATTO      INTEGER PRIMARY KEY AUTOINCREMENT,
  RISTORANTE_ID  INTEGER,
  NOME_PIATTO    TEXT           NOT NULL,
  DESCRIZIONE    TEXT,
  PREZZO         DECIMAL(10, 2) NOT NULL,
  IMG_URL_PIATTO TEXT,
  FOREIGN KEY (RISTORANTE_ID) REFERENCES RISTORANTE (P_IVA_RISTORANTE) ON DELETE CASCADE
);

/*
-- Zona
CREATE TABLE ZONA
(
  ID_ZONA TEXT(4) PRIMARY KEY
);

-- Comune
CREATE TABLE COMUNE
(
  NOME_COMUNE    TEXT(20),
  PROVINCIA      TEXT(2),
  ZONA_ASSOCIATA TEXT(4),
  PRIMARY KEY (NOME_COMUNE),
  FOREIGN KEY (ZONA_ASSOCIATA) REFERENCES ZONA (ID_ZONA)
);

-- Locale
CREATE TABLE LOCALE
(
  P_IVA             TEXT(11),
  NOME_LOCALE       TEXT(20) UNIQUE NOT NULL,
  N_TELEFONO_LOCALE TEXT(10) UNIQUE NOT NULL,
  VIA_LOCALE        TEXT(20) NOT NULL,
  CAP_LOCALE        TEXT(20) NOT NULL,
  COMUNE_SEDE       TEXT(20),
  IMMAGINE_URL      TEXT,
  PRIMARY KEY (P_IVA),
  FOREIGN KEY (COMUNE_SEDE) REFERENCES COMUNE (NOME_COMUNE)
);

-- Rider
CREATE TABLE RIDER
(
  CF_RIDER          TEXT(16) PRIMARY KEY,
  NOME_RIDER        TEXT(20) NOT NULL,
  COGNOME_RIDER     TEXT(20) NOT NULL,
  TELEFONO_RIDER    TEXT(10) UNIQUE,
  COMUNE_LAVORATIVO TEXT(20),
  FOREIGN KEY (COMUNE_LAVORATIVO) REFERENCES COMUNE (NOME_COMUNE)
);

-- PRENOTAZIONE
CREATE TABLE PRENOTAZIONE
(
  ANNO              INTEGER NOT NULL,
  DATA_PRENOTAZIONE DATE,
  GIORNO            TEXT(20) NOT NULL,
  ORA_INIZIO        DATETIME NOT NULL,
  ORA_FINE          DATETIME NOT NULL,
  PRIMARY KEY (DATA_PRENOTAZIONE, ANNO, GIORNO),
  CHECK (
      (strftime('%H', ORA_INIZIO) >= '19' AND strftime('%H', ORA_FINE) <= '24')
      AND
      (strftime('%H', ORA_INIZIO) < strftime('%H', ORA_FINE))
  ),
  CHECK (GIORNO IN ('LUNEDI', 'MARTEDI', 'MERCOLEDI', 'GIOVEDI', 'VENERDI', 'SABATO', 'DOMENICA'))
);

-- Cliente
CREATE TABLE CLIENTE
(
  NOME_CLIENTE    TEXT(20) NOT NULL,
  COGNOME_CLIENTE TEXT(20),
  EMAIL           TEXT(30) NOT NULL,
  PASSWORD        TEXT(30) NOT NULL,
  COMUNE_RES      TEXT(20),
  PRIMARY KEY (EMAIL),
  FOREIGN KEY (COMUNE_RES) REFERENCES COMUNE (NOME_COMUNE),
  FOREIGN KEY (EMAIL) REFERENCES INFORMAZIONI_CONSEGNA(EMAIL_CLIENTE),
  FOREIGN KEY(EMAIL) REFERENCES PAGAMENTO(SCONTRINO)
);

-- PAGAMENTO
CREATE TABLE PAGAMENTO
(
  SCONTRINO  TEXT(10),
  IMPORTO    INTEGER,
  METODO_PAY TEXT(30),
  PRIMARY KEY (SCONTRINO),
  CHECK (
        METODO_PAY = 'CONTANTI'
      OR METODO_PAY = 'CARTA DI CREDITO/DEBITO'
  ),
FOREIGN KEY (SCONTRINO) REFERENCES CARTA(NUMERO_CARTA)
);

CREATE TABLE CARTA
(
  NUMERO_CARTA TEXT(16),
  SCADENZA_CARTA  TEXT(7) NOT NULL CHECK (SCADENZA_CARTA LIKE '____-__'),
  CVV INTEGER NOT NULL CHECK (LENGTH(CVV) = 3),
PRIMARY KEY (NUMERO_CARTA)
);
-- Informazioni consegna
CREATE TABLE INFORMAZIONI_CONSEGNA
(
  VIA_CLIENTE    TEXT(20) NOT NULL,
  CITTA_CLIENTE  TEXT(20) NOT NULL,
  CAP_CLIENTE    TEXT(10) NOT NULL,
  CITOFONO       TEXT(20),
  NOTE_PER_RIDER TEXT(30),
  EMAIL_CLIENTE  TEXT(30),
  PRIMARY KEY (VIA_CLIENTE, CITTA_CLIENTE, CAP_CLIENTE),
  FOREIGN KEY (EMAIL_CLIENTE) REFERENCES CLIENTE (EMAIL)
);

-- ORDINE
CREATE TABLE ORDINE
(
  N_ORDINE           INTEGER NOT NULL,
  STATO              TEXT(20) NOT NULL,
  P_IVALOCALE        TEXT(11),
  CF_CONSEGNATORE    TEXT(16),
  EMAIL_DESTINATARIO TEXT(30),
  SCONTRINO_ORDINE   TEXT(10),
  DATA_E_ORA         DATETIME,
  PRIMARY KEY (N_ORDINE),
  FOREIGN KEY (P_IVALOCALE) REFERENCES LOCALE (P_IVA),
  FOREIGN KEY (CF_CONSEGNATORE) REFERENCES RIDER (CF_RIDER),
  FOREIGN KEY (EMAIL_DESTINATARIO) REFERENCES CLIENTE (EMAIL),
  FOREIGN KEY (SCONTRINO_ORDINE) REFERENCES PAGAMENTO (SCONTRINO),
  CHECK (
    STATO IN ('IN LAVORAZIONE', 'RITIRATO', 'IN CONSEGNA', 'CONSEGNATO')
  )
);

-- Prodotto
CREATE TABLE PRODOTTO
(
  ID_PRODOTTO   INTEGER NOT NULL,
  NOME_PRODOTTO TEXT(20) NOT NULL,
  TIPO_PRODOTTO TEXT(20),
  P_IVA_LOCALE  TEXT(11),
  PRIMARY KEY (ID_PRODOTTO),
  FOREIGN KEY (P_IVA_LOCALE) REFERENCES LOCALE (P_IVA)
);

-- Presenti
CREATE TABLE PRESENTI
(
  IDPRODOTTO INTEGER,
  NORDINE    INTEGER,
  QUANTITA   INTEGER,
  PRIMARY KEY (IDPRODOTTO, NORDINE),
  FOREIGN KEY (IDPRODOTTO) REFERENCES PRODOTTO (ID_PRODOTTO),
  FOREIGN KEY (NORDINE) REFERENCES ORDINE (N_ORDINE)
);

-- Effettuano
CREATE TABLE EFFETTUANO
(
  CODF_RIDER        TEXT(16),
  ANNO1             INTEGER,
  DATAPRENOTAZIONE  DATE,
  GIORNO_LAVORATIVO TEXT(20),
  PRIMARY KEY (CODF_RIDER, ANNO1, DATAPRENOTAZIONE, GIORNO_LAVORATIVO),
  FOREIGN KEY (CODF_RIDER) REFERENCES RIDER (CF_RIDER),
  FOREIGN KEY (ANNO1, DATAPRENOTAZIONE, GIORNO_LAVORATIVO) REFERENCES PRENOTAZIONE (ANNO, DATA_PRENOTAZIONE, GIORNO)
);
*/
