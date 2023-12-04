create PROCEDURE NUMERO_CONSEGNE_RIDER(CF_RIDER IN CHAR)
  IS
  CONT INTEGER;
BEGIN
  SELECT COUNT(*)
  INTO CONT
  FROM ORDINE
  WHERE CF_CONSEGNATORE = CF_RIDER;
  DBMS_OUTPUT.PUT_LINE('IL RIDER CON CF ' || CF_RIDER || ' HA EFFETTUATO ' || CONT || '    CONSEGNE.');
END;
/

