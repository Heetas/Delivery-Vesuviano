-- Zona
INSERT INTO ZONA(ID_ZONA) VALUES (1);
INSERT INTO ZONA(ID_ZONA) VALUES (2);
INSERT INTO ZONA(ID_ZONA) VALUES (3);
INSERT INTO ZONA(ID_ZONA) VALUES (4);

-- Comune
INSERT INTO COMUNE(NOME_COMUNE, PROVINCIA, ZONA_ASSOCIATA) VALUES ('STRIANO', 'NA', 1);
INSERT INTO COMUNE(NOME_COMUNE, PROVINCIA, ZONA_ASSOCIATA) VALUES ('SARNO', 'SA', 2);
INSERT INTO COMUNE(NOME_COMUNE, PROVINCIA, ZONA_ASSOCIATA) VALUES ('PALMA CAMPANIA', 'NA', 1);
INSERT INTO COMUNE(NOME_COMUNE, PROVINCIA, ZONA_ASSOCIATA) VALUES ('POGGIOMARINO', 'NA', 1);
INSERT INTO COMUNE(NOME_COMUNE, PROVINCIA, ZONA_ASSOCIATA) VALUES ('OTTAVIANO', 'NA', 3);
INSERT INTO COMUNE(NOME_COMUNE, PROVINCIA, ZONA_ASSOCIATA) VALUES ('SAN GIUSEPPE VSV.', 'NA', 3);
INSERT INTO COMUNE(NOME_COMUNE, PROVINCIA, ZONA_ASSOCIATA) VALUES ('SAN VALENTINO TORIO', 'SA', 4);

-- Prenotazione
INSERT INTO PRENOTAZIONE (ANNO, DATA_PRENOTAZIONE, GIORNO, ORA_INIZIO, ORA_FINE)
VALUES (2023, '2023-07-10', 'LUNEDI', '2023-07-10 19:30:00', '2023-07-10 23:00:00');
INSERT INTO PRENOTAZIONE (ANNO, DATA_PRENOTAZIONE, GIORNO, ORA_INIZIO, ORA_FINE)
VALUES (2023, '2023-07-11', 'MARTEDI', '2023-07-11 19:30:00', '2023-07-11 23:00:00');
INSERT INTO PRENOTAZIONE (ANNO, DATA_PRENOTAZIONE, GIORNO, ORA_INIZIO, ORA_FINE)
VALUES (2023, '2023-07-12', 'MERCOLEDI', '2023-07-12 19:30:00', '2023-07-12 23:00:00');
INSERT INTO PRENOTAZIONE (ANNO, DATA_PRENOTAZIONE, GIORNO, ORA_INIZIO, ORA_FINE)
VALUES (2023, '2023-07-13', 'GIOVEDI', '2023-07-13 19:30:00', '2023-07-13 23:00:00');
INSERT INTO PRENOTAZIONE (ANNO, DATA_PRENOTAZIONE, GIORNO, ORA_INIZIO, ORA_FINE)
VALUES (2023, '2023-07-14', 'VENERDI', '2023-07-14 19:15:00', '2023-07-14 23:45:00');
INSERT INTO PRENOTAZIONE (ANNO, DATA_PRENOTAZIONE, GIORNO, ORA_INIZIO, ORA_FINE)
VALUES (2023, '2023-07-15', 'SABATO', '2023-07-15 19:15:00', '2023-07-15 23:45:00');
INSERT INTO PRENOTAZIONE (ANNO, DATA_PRENOTAZIONE, GIORNO, ORA_INIZIO, ORA_FINE)
VALUES (2023, '2023-07-16', 'DOMENICA', '2023-07-16 19:15:00', '2023-07-16 23:45:00');

-- Rider
INSERT INTO RIDER (CF_RIDER, NOME_RIDER, COGNOME_RIDER, TELEFONO_RIDER, COMUNE_LAVORATIVO)
VALUES ('CF001', 'MASSIMO', 'VERDI', '1234567890', 'PALMA CAMPANIA');
INSERT INTO RIDER (CF_RIDER, NOME_RIDER, COGNOME_RIDER, TELEFONO_RIDER, COMUNE_LAVORATIVO)
VALUES ('CF002', 'NELLO', 'GALLO', '0987654321', 'STRIANO');
INSERT INTO RIDER (CF_RIDER, NOME_RIDER, COGNOME_RIDER, TELEFONO_RIDER, COMUNE_LAVORATIVO)
VALUES ('CF003', 'PASQUALE', 'PICCOLO', '4563738901', 'POGGIOMARINO');
INSERT INTO RIDER (CF_RIDER, NOME_RIDER, COGNOME_RIDER, TELEFONO_RIDER, COMUNE_LAVORATIVO)
VALUES ('CF004', 'MARIA', 'NAPPI', '4123998800', 'OTTAVIANO');
INSERT INTO RIDER (CF_RIDER, NOME_RIDER, COGNOME_RIDER, TELEFONO_RIDER, COMUNE_LAVORATIVO)
VALUES ('CF005', 'CARLO', 'DE FILIPPO', '1230987444', 'SARNO');
INSERT INTO RIDER (CF_RIDER, NOME_RIDER, COGNOME_RIDER, TELEFONO_RIDER, COMUNE_LAVORATIVO)
VALUES ('CF006', 'ALBERTO', 'AMMIRATI', '0932177250', 'SAN GIUSEPPE VSV.');
INSERT INTO RIDER (CF_RIDER, NOME_RIDER, COGNOME_RIDER, TELEFONO_RIDER, COMUNE_LAVORATIVO)
VALUES ('CF007', 'MICHELE', 'ANNUNZIATA', '0817720112', 'SAN VALENTINO TORIO');

-- Locale
INSERT INTO LOCALE (P_IVA, NOME_LOCALE, N_TELEFONO_LOCALE, VIA_LOCALE, CAP_LOCALE, COMUNE_SEDE)
VALUES ('12345678901', 'RISTORANTE BELLA', '0123456789', 'VIA ROMA 1', '84047', 'SARNO');
INSERT INTO LOCALE (P_IVA, NOME_LOCALE, N_TELEFONO_LOCALE, VIA_LOCALE, CAP_LOCALE, COMUNE_SEDE)
VALUES ('23456789012', 'BAR LA PIAZZETTA', '1234567890', 'VIA MILANO 2', '80047', 'SAN GIUSEPPE VSV.');
INSERT INTO LOCALE (P_IVA, NOME_LOCALE, N_TELEFONO_LOCALE, VIA_LOCALE, CAP_LOCALE, COMUNE_SEDE)
VALUES ('34567890123', 'PIZZERIA DA GIOVANNI', '2345678901', 'VIA NAPOLI 3', '80040', 'POGGIOMARINO');
INSERT INTO LOCALE (P_IVA, NOME_LOCALE, N_TELEFONO_LOCALE, VIA_LOCALE, CAP_LOCALE, COMUNE_SEDE)
VALUES ('45678901234', 'OSTERIA BUONAIUTO', '3456789012', 'VIA TORINO 4', '80036', 'PALMA CAMPANIA');
INSERT INTO LOCALE (P_IVA, NOME_LOCALE, N_TELEFONO_LOCALE, VIA_LOCALE, CAP_LOCALE, COMUNE_SEDE)
VALUES ('67890123456', 'SUSHI BAR SAKURA', '5678901234', 'VIA BOLOGNA 6', '80044', 'OTTAVIANO');
INSERT INTO LOCALE (P_IVA, NOME_LOCALE, N_TELEFONO_LOCALE, VIA_LOCALE, CAP_LOCALE, COMUNE_SEDE)
VALUES ('89012345678', 'SEAFOOD RESTAURANT', '7890123456', 'VIA GENOVA 8', '84010', 'SAN VALENTINO TORIO');

-- Cliente
INSERT INTO CLIENTE (NOME_CLIENTE, COGNOME_CLIENTE, EMAIL, COMUNE_RES, PASSWORD)
VALUES ('GIULIA', 'VERDI', 'GIULIA@EMAIL.COM', 'STRIANO', 'a');
INSERT INTO CLIENTE (NOME_CLIENTE, COGNOME_CLIENTE, EMAIL, COMUNE_RES, PASSWORD)
VALUES ('PAOLA', 'GIALLI', 'PAOLA@EMAIL.COM', 'SARNO', 'b');
INSERT INTO CLIENTE (NOME_CLIENTE, COGNOME_CLIENTE, EMAIL, COMUNE_RES, PASSWORD)
VALUES ('ALESSANDRO', 'MARRONI', 'ALESSANDRO@EMAIL.COM', 'PALMA CAMPANIA', 'c');
INSERT INTO CLIENTE (NOME_CLIENTE, COGNOME_CLIENTE, EMAIL, COMUNE_RES, PASSWORD)
VALUES ('FEDERICA', 'ROSA', 'FEDERICA@EMAIL.COM', 'SARNO', 'd');
INSERT INTO CLIENTE (NOME_CLIENTE, COGNOME_CLIENTE, EMAIL, COMUNE_RES, PASSWORD)
VALUES ('GIOVANNI', 'ARANCIO', 'GIOVANNI@EMAIL.COM', 'POGGIOMARINO', 'e');
INSERT INTO CLIENTE (NOME_CLIENTE, COGNOME_CLIENTE, EMAIL, COMUNE_RES, PASSWORD)
VALUES ('STEFANIA', 'VIOLA', 'STEFANIA@EMAIL.COM', 'SAN GIUSEPPE VSV.', 'f');
INSERT INTO CLIENTE (NOME_CLIENTE, COGNOME_CLIENTE, EMAIL, COMUNE_RES, PASSWORD)
VALUES ('MARTINA', 'AZZURRO', 'MARTINA@EMAIL.COM', 'PALMA CAMPANIA', 'g');
INSERT INTO CLIENTE (NOME_CLIENTE, COGNOME_CLIENTE, EMAIL, COMUNE_RES, PASSWORD)
VALUES ('MARIO', 'ROSSI', 'MARIO@EMAIL.COM', 'STRIANO', 'h');

-- Pagamento
INSERT INTO PAGAMENTO (SCONTRINO, IMPORTO, METODO_PAY)
VALUES ('6', 55, 'CARTA DI CREDITO/DEBITO');
INSERT INTO PAGAMENTO (SCONTRINO, IMPORTO, METODO_PAY)
VALUES ('7', 12, 'CONTANTI');
INSERT INTO PAGAMENTO (SCONTRINO, IMPORTO, METODO_PAY)
VALUES ('8', 18, 'CARTA DI CREDITO/DEBITO');
INSERT INTO PAGAMENTO (SCONTRINO, IMPORTO, METODO_PAY)
VALUES ('2', 28, 'CARTA DI CREDITO/DEBITO');

-- Informazioni consegna
INSERT INTO INFORMAZIONI_CONSEGNA (VIA_CLIENTE, CITTA_CLIENTE, CAP_CLIENTE, EMAIL_CLIENTE)
VALUES ('VIA ROMA 8', 'SAN VALENTINO TORIO', '84010', 'STEFANIA@EMAIL.COM');
INSERT INTO INFORMAZIONI_CONSEGNA (VIA_CLIENTE, CITTA_CLIENTE, CAP_CLIENTE, EMAIL_CLIENTE)
VALUES ('VIA TORINO 1', 'SARNO', '84087', 'PAOLA@EMAIL.COM');
INSERT INTO INFORMAZIONI_CONSEGNA (VIA_CLIENTE, CITTA_CLIENTE, CAP_CLIENTE, EMAIL_CLIENTE)
VALUES ('VIA PASSANTI 8', 'POGGIOMARINO', '80040', 'GIOVANNI@EMAIL.COM');

--Ordine
INSERT INTO ORDINE (N_ORDINE, STATO, P_IVALOCALE, CF_CONSEGNATORE, EMAIL_DESTINATARIO, SCONTRINO_ORDINE, DATA_E_ORA)
VALUES (1, 'CONSEGNATO', '45678901234', 'CF001', 'ALESSANDRO@EMAIL.COM ', '8 ', CURRENT_TIMESTAMP);
INSERT INTO ORDINE (N_ORDINE, STATO, P_IVALOCALE, CF_CONSEGNATORE, EMAIL_DESTINATARIO, SCONTRINO_ORDINE, DATA_E_ORA)
VALUES (2, 'IN CONSEGNA', '34567890123', 'CF003', 'GIOVANNI@EMAIL.COM ', '2 ', CURRENT_TIMESTAMP);
INSERT INTO ORDINE (N_ORDINE, STATO, P_IVALOCALE, CF_CONSEGNATORE, EMAIL_DESTINATARIO, SCONTRINO_ORDINE, DATA_E_ORA)
VALUES (3, 'IN LAVORAZIONE', '45678901234', 'CF001', 'ALESSANDRO@EMAIL.COM ', '6', CURRENT_TIMESTAMP);
INSERT INTO ORDINE (N_ORDINE, STATO, P_IVALOCALE, CF_CONSEGNATORE, EMAIL_DESTINATARIO, SCONTRINO_ORDINE, DATA_E_ORA)
VALUES (4, 'IN CONSEGNA', '12345678901', 'CF005', 'PAOLA@EMAIL.COM ', '7 ', CURRENT_TIMESTAMP);

--Prodotto
INSERT INTO PRODOTTO (ID_PRODOTTO, NOME_PRODOTTO, TIPO_PRODOTTO, P_IVA_LOCALE)
VALUES (1, 'PIZZA', 'DIAVOLA', '34567890123');
INSERT INTO PRODOTTO (ID_PRODOTTO, NOME_PRODOTTO, TIPO_PRODOTTO, P_IVA_LOCALE)
VALUES (2, 'PIZZA', 'DIAVOLA', '34567890123');
INSERT INTO PRODOTTO (ID_PRODOTTO, NOME_PRODOTTO, TIPO_PRODOTTO, P_IVA_LOCALE)
VALUES (3, 'PIZZA', 'MARINARA', '34567890123');
INSERT INTO PRODOTTO (ID_PRODOTTO, NOME_PRODOTTO, TIPO_PRODOTTO, P_IVA_LOCALE)
VALUES (4, 'PASTA', 'PENNETTE AL POMODORO', '12345678901');
INSERT INTO PRODOTTO (ID_PRODOTTO, NOME_PRODOTTO, TIPO_PRODOTTO, P_IVA_LOCALE)
VALUES (5, 'PASTA', 'CARBONARA', '12345678901');

--Presenti
INSERT INTO PRESENTI(IDPRODOTTO, NORDINE, QUANTITA)
VALUES (2, 1, 3);
INSERT INTO PRESENTI(IDPRODOTTO, NORDINE, QUANTITA)
VALUES (1, 3, 3);

-- Effettuano
INSERT INTO EFFETTUANO (CODF_RIDER, ANNO1, DATAPRENOTAZIONE, GIORNO_LAVORATIVO)
VALUES ('CF001', 2023, '2023-07-15', 'SABATO');
INSERT INTO EFFETTUANO (CODF_RIDER, ANNO1, DATAPRENOTAZIONE, GIORNO_LAVORATIVO)
VALUES ('CF003', 2023, '2023-07-10', 'LUNEDI');
INSERT INTO EFFETTUANO (CODF_RIDER, ANNO1, DATAPRENOTAZIONE, GIORNO_LAVORATIVO)
VALUES ('CF005', 2023, '2023-07-10', 'LUNEDI');
