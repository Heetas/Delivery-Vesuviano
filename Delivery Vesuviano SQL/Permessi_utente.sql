ADMIN:
CREATE USER RESPONSABILE_ADMIN IDENTIFIED BY ADMIN; GRANT CONNECT, RESOURCE, DBA, TO RESPONSABILE_ADMIN; 
GRANT ALL PRIVILEGES TO RESPONSABILE_ADMIN; 
--------------------------------------------
RIDER:
CREATE USER RIDER_USER IDENTIFIED BY PASSWORD_RIDER;
GRANT CREATE SESSION TO RIDER_USER;
GRANT SELECT ON INFORMAZIONI_CONSEGNA TO RIDER_USER;
GRANT SELECT ON LOCALE TO RIDER_USER; 
GRANT SELECT ON ORDINE TO RIDER_USER;
GRANT SELECT ON PAGAMENTO TO RIDER_USER;
GRANT INSERT, UPDATE ON EFFETTUANO TO RIDER_USER;
------------------------------------------------
CLIENTE
CREATE USER CLIENTE_USER IDENTIFIED BY PASSWORD_CLIENTE;
GRANT CONNECT TO CLIENTE_USER;
GRANT CREATE SESSION TO CLIENTE_USER;
GRANT SELECT ON LOCALE TO CLIENTE_USER;
GRANT SELECT,INSERT,UPDATE ON INFORMAZIONI_CONSEGNA TO CLIENTE_USER;
GRANT SELECT ON PAGAMENTO TO CLIENTE_USER;
GRANT SELECT PRODOTTO TO CLIENTE_USER;
GRANT SELECT CLIENTE_VIEW TO CLIENTE_USER;
---------------------------------------------