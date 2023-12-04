CREATE OR REPLACE TRIGGER LIMITA_PRENOTAZIONI
  BEFORE INSERT
  ON EFFETTUANO
  FOR EACH ROW
DECLARE
  LUNEDI_COUNT    NUMBER;
  MARTEDI_COUNT   NUMBER;
  MERCOLEDI_COUNT NUMBER;
  GIOVEDI_COUNT   NUMBER;
  VENERDI_COUNT   NUMBER;
  SABATO_COUNT    NUMBER;
  DOMENICA_COUNT  NUMBER;
BEGIN
  IF :NEW.GIORNO_LAVORATIVO = 'LUNEDI' THEN
    SELECT COUNT(*)
    INTO LUNEDI_COUNT
    FROM EFFETTUANO
    WHERE ANNO1 = EXTRACT(YEAR FROM :NEW.DATAPRENOTAZIONE)
      AND GIORNO_LAVORATIVO = 'LUNEDI';

    IF LUNEDI_COUNT >= 5 THEN
      RAISE_APPLICATION_ERROR(-20001, 'È STATO RAGGIUNTO IL LIMITE MASSIMO DI PRENOTAZIONI PER IL LUNEDÌ.');
    END IF;
  ELSIF :NEW.GIORNO_LAVORATIVO = 'MARTEDI' THEN
    SELECT COUNT(*)
    INTO MARTEDI_COUNT
    FROM EFFETTUANO
    WHERE ANNO1 = EXTRACT(YEAR FROM :NEW.DATAPRENOTAZIONE)
      AND GIORNO_LAVORATIVO = 'MARTEDI';

    IF MARTEDI_COUNT >= 5 THEN
      RAISE_APPLICATION_ERROR(-20002, 'È STATO RAGGIUNTO IL LIMITE MASSIMO DI PRENOTAZIONI PER IL MARTEDÌ.');
    END IF;
  ELSIF :NEW.GIORNO_LAVORATIVO = 'MERCOLEDI' THEN
    SELECT COUNT(*)
    INTO MERCOLEDI_COUNT
    FROM EFFETTUANO
    WHERE ANNO1 = EXTRACT(YEAR FROM :NEW.DATAPRENOTAZIONE)
      AND GIORNO_LAVORATIVO = 'MERCOLEDI';

    IF MERCOLEDI_COUNT >= 5 THEN
      RAISE_APPLICATION_ERROR(-20003, 'È STATO RAGGIUNTO IL LIMITE MASSIMO DI PRENOTAZIONI PER IL MERCOLEDÌ.');
    END IF;
  ELSIF :NEW.GIORNO_LAVORATIVO = 'GIOVEDI' THEN
    SELECT COUNT(*)
    INTO GIOVEDI_COUNT
    FROM EFFETTUANO
    WHERE ANNO1 = EXTRACT(YEAR FROM :NEW.DATAPRENOTAZIONE)
      AND GIORNO_LAVORATIVO = 'GIOVEDI';

    IF GIOVEDI_COUNT >= 5 THEN
      RAISE_APPLICATION_ERROR(-20004, 'È STATO RAGGIUNTO IL LIMITE MASSIMO DI PRENOTAZIONI PER IL GIOVEDÌ.');
    END IF;
  ELSIF :NEW.GIORNO_LAVORATIVO = 'VENERDI' THEN
    SELECT COUNT(*)
    INTO VENERDI_COUNT
    FROM EFFETTUANO
    WHERE ANNO1 = EXTRACT(YEAR FROM :NEW.DATAPRENOTAZIONE)
      AND GIORNO_LAVORATIVO = 'VENERDI';

    IF VENERDI_COUNT >= 10 THEN
      RAISE_APPLICATION_ERROR(-20005, 'È STATO RAGGIUNTO IL LIMITE MASSIMO DI PRENOTAZIONI PER IL VENERDÌ.');
    END IF;
  ELSIF :NEW.GIORNO_LAVORATIVO = 'SABATO' THEN
    SELECT COUNT(*)
    INTO SABATO_COUNT
    FROM EFFETTUANO
    WHERE ANNO1 = EXTRACT(YEAR FROM :NEW.DATAPRENOTAZIONE)
      AND GIORNO_LAVORATIVO = 'SABATO';

    IF SABATO_COUNT >= 10 THEN
      RAISE_APPLICATION_ERROR(-20006, 'È STATO RAGGIUNTO IL LIMITE MASSIMO DI PRENOTAZIONI PER IL SABATO.');
    END IF;
  ELSIF :NEW.GIORNO_LAVORATIVO = 'DOMENICA' THEN
    SELECT COUNT(*)
    INTO DOMENICA_COUNT
    FROM EFFETTUANO
    WHERE ANNO1 = EXTRACT(YEAR FROM :NEW.DATAPRENOTAZIONE)
      AND GIORNO_LAVORATIVO = 'DOMENICA';

    IF DOMENICA_COUNT >= 10 THEN
      RAISE_APPLICATION_ERROR(-20007, 'È STATO RAGGIUNTO IL LIMITE MASSIMO DI PRENOTAZIONI PER LA DOMENICA.');
    END IF;
  END IF;
END;



CREATE SEQUENCE SEQ_RIDER_ID START WITH 1 INCREMENT BY 1;



CREATE OR REPLACE TRIGGER TRG_INCREMENTARIDERID
  BEFORE INSERT
  ON RIDER
  FOR EACH ROW
BEGIN
  SELECT SEQ_RIDER_ID.NEXTVAL INTO :NEW.RIDER_ID FROM DUAL;
END;



CREATE OR REPLACE TRIGGER OBBLIGA_PAGAMENTO_CARTA
  BEFORE INSERT
  ON PAGAMENTO
  FOR EACH ROW
BEGIN
  IF :NEW.METODO_PAY != 'CARTA DI CREDITO/DEBITO' AND :NEW.IMPORTO > 35 THEN
    RAISE_APPLICATION_ERROR(-20008, 'L''IMPORTO SUPERA I 35 EURO. È OBBLIGATORIO PAGARE CON CARTA DI CREDITO/DEBITO.');
  END IF;
END;



CREATE OR REPLACE TRIGGER TRG_RITIRACONSEGNA
  BEFORE INSERT
  ON ORDINE
  FOR EACH ROW
DECLARE
  V_COMUNE_RIDER        COMUNE.NOME_COMUNE%TYPE;
  V_COMUNE_LOCALE       LOCALE.COMUNE_SEDE%TYPE;
  V_COMUNE_DESTINATARIO CLIENTE.COMUNE_RES%TYPE;
BEGIN
  SELECT COMUNE_LAVORATIVO INTO V_COMUNE_RIDER FROM RIDER WHERE CF_RIDER = :NEW.CF_CONSEGNATORE;
  SELECT COMUNE_SEDE INTO V_COMUNE_LOCALE FROM LOCALE WHERE P_IVA = :NEW.P_IVALOCALE;
  SELECT COMUNE_RES INTO V_COMUNE_DESTINATARIO FROM CLIENTE WHERE EMAIL = :NEW.EMAIL_DESTINATARIO;
  IF V_COMUNE_RIDER <> V_COMUNE_LOCALE OR V_COMUNE_RIDER <> V_COMUNE_DESTINATARIO THEN
    RAISE_APPLICATION_ERROR(-20009,
                            'IL RIDER PUÒ RITIRARE AL LOCALE E CONSEGNARE AL CLIENTE SOLO NELLO STESSO COMUNE.');
  END IF;
END;



CREATE OR REPLACE TRIGGER TRG_CONTROLLOIMPORTOMINIMO
  BEFORE INSERT
  ON PAGAMENTO
  FOR EACH ROW
BEGIN
  IF :NEW.IMPORTO <= 10 THEN
    RAISE_APPLICATION_ERROR(-20010, 'L''IMPORTO DEL PAGAMENTO DEVE ESSERE MAGGIORE DI 10.');
  END IF;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('ERRORE: ' || SQLERRM);
    RAISE;
END;



CREATE OR REPLACE TRIGGER TRG_ORDINE_BEFORE_INSERT
  BEFORE INSERT
  ON ORDINE
  FOR EACH ROW
DECLARE
  V_RIDER_STATO VARCHAR(20);
BEGIN
  SELECT STATO
  INTO V_RIDER_STATO
  FROM ORDINE
  WHERE CF_CONSEGNATORE = :NEW.CF_CONSEGNATORE
  ORDER BY DATA_E_ORA DESC
    FETCH FIRST 1 ROW ONLY;
  IF V_RIDER_STATO IN ('IN LAVORAZIONE', 'RITIRATO', 'IN CONSEGNA') THEN
    RAISE_APPLICATION_ERROR(-20011, 'IL RIDER È GIÀ OCCUPATO CON LA CONSEGNA DI UN ALTRO ORDINE.');
  END IF;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    NULL;
END;
