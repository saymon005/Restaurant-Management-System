SET SERVEROUTPUT ON;
SET VERIFY OFF;

	/*CREATE MENU TABLE*/
	drop table MENU;
	CREATE TABLE MENU AS 
	SELECT * FROM MenuItems1 
	UNION 
	SELECT * FROM MenuItems2@site_link;
	
	ALTER TABLE MENU
	ADD PRIMARY KEY (item_id);
	/*INSERT MENU*/
DECLARE
  ITEM_ID_ MenuItems1.item_id%TYPE;
  ITEM_NAME MenuItems1.name%TYPE := 'Burger';  
  ITEM_DES MenuItems1.description%TYPE := 'Delicous'; 
  ITEM_PRICE MenuItems1.price%TYPE := 250;  
  ITEM_CAT MenuItems1.category%TYPE := 'Bangalee';
  cat_exception EXCEPTION;  
BEGIN
  SELECT COUNT(item_id) INTO ITEM_ID_ FROM MENU;

  ITEM_ID_ := ITEM_ID_ + 1;
  
  IF (ITEM_CAT ='Chinese') THEN
    INSERT INTO MenuItems2@site_link (item_id, name, description, price, category) VALUES (ITEM_ID_, ITEM_NAME, ITEM_DES, ITEM_PRICE, ITEM_CAT);
  ELSIF (ITEM_CAT ='Bangalee') THEN
    INSERT INTO MenuItems1 (item_id, name, description, price, category) VALUES (ITEM_ID_, ITEM_NAME, ITEM_DES, ITEM_PRICE, ITEM_CAT);
  ELSE 
    RAISE cat_exception;
  END IF;

EXCEPTION
  WHEN cat_exception THEN
    DBMS_OUTPUT.PUT_LINE('Sorry, your category not found.');
END;
/