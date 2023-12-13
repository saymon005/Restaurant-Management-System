SET SERVEROUTPUT ON;
SET VERIFY OFF;


	/*
	ITEM_ID MenuItems1.item_id%TYPE := &ITEM_ID_INPUT;
	ITEM_PRICE MenuItems1.price%TYPE := &ITEM_PRICE_INPUT;
	ITEM_NAME MenuItems1.name%TYPE := &ITEM_NAME_INPUT;
	ITEM_DES MenuItems1.description%TYPE:=&ITEM_DES_INPUT;
	ITEM_CATEGORY MenuItems1.category@TYPE := &ITEM_CATEGORY_INPUT;
	
	*/

	
	select * from MenuItems1;
	
DECLARE

	ITEM_ID_ int:= 7;
	ITEM_PRICE MenuItems1.price%TYPE := 233;
	ITEM_NAME MenuItems1.name%TYPE := 'Fried rice';
	ITEM_DES MenuItems1.description%TYPE:='There will Chicken';
	ITEM_CAT MenuItems1.category%TYPE := 'Chinese';	
	
	NEGATIVE EXCEPTION;  
BEGIN

	if ITEM_CAT = 'Bangalee' THEN
		UPDATE MenuItems1 SET price = ITEM_PRICE, name = ITEM_NAME, description = ITEM_DES, category = ITEM_CAT WHERE item_id = ITEM_ID_;
	ELSIF ITEM_CAT = 'Chinese' THEN
		delete MenuItems1 where item_id=ITEM_ID_;
		insert into MenuItems2@site_link(item_id,price,name,description,category) values(ITEM_ID_,ITEM_PRICE,ITEM_NAME,ITEM_DES,ITEM_CAT);
	ELSE
		RAISE NEGATIVE;
	end if;

EXCEPTION
  WHEN NEGATIVE THEN
    DBMS_OUTPUT.PUT_LINE('Negative, so not found.');		
   
END;
/
