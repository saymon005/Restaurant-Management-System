SET SERVEROUTPUT ON;
SET VERIFY OFF;

	drop table MENU;
	CREATE TABLE MENU AS 
	SELECT * FROM MenuItems2
	UNION 
	SELECT * FROM MenuItems1@site_link;
	
	ALTER TABLE MENU
	ADD PRIMARY KEY (item_id);
	/*INSERT MENU*/
DECLARE
  ITEM_ID MenuItems2.item_id%TYPE;
  ITEM_NAME MenuItems2.name%TYPE := 'Chow Mein';  
  ITEM_DES MenuItems2.description%TYPE := 'Delicios'; 
  ITEM_PRICE MenuItems2.price%TYPE := 250;  
  ITEM_CAT MenuItems2.category%TYPE := 'Chinese';
  cat_exception EXCEPTION;  
BEGIN
  SELECT COUNT(item_id) INTO ITEM_ID FROM MENU;

  ITEM_ID := ITEM_ID + 1;
  
  IF (ITEM_CAT = 'Chinese') THEN
    INSERT INTO MenuItems2 (item_id, name, description, price, category) VALUES (ITEM_ID, ITEM_NAME, ITEM_DES, ITEM_PRICE, ITEM_CAT);
  ELSIF (ITEM_CAT = 'Bangalee') THEN
    INSERT INTO MenuItems1@site_link (item_id, name, description, price, category) VALUES (ITEM_ID, ITEM_NAME, ITEM_DES, ITEM_PRICE, ITEM_CAT);
  ELSE 
    RAISE cat_exception;
  END IF;

EXCEPTION
  WHEN cat_exception THEN
    DBMS_OUTPUT.PUT_LINE('Sorry, your category not found');
END;
/
