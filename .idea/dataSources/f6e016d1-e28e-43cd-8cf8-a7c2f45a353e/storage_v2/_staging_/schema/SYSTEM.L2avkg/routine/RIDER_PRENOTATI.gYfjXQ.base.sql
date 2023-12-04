create PROCEDURE RIDER_PRENOTATI
  IS
BEGIN
  FOR REC IN (
    SELECT EFFETTUANO.CODF_RIDER, COUNT(*) AS NUM_PRENOTAZIONI
    FROM EFFETTUANO
           INNER JOIN RIDER ON EFFETTUANO.CODF_RIDER = RIDER.CF_RIDER
    GROUP BY EFFETTUANO.CODF_RIDER
    )
    LOOP
      DBMS_OUTPUT.PUT_LINE('RIDER:' || REC.CODF_RIDER || ', NUMERO DI PRENOTAZIONI: ' || REC.NUM_PRENOTAZIONI);
    END LOOP;
END;
/

