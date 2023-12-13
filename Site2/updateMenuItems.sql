SET SERVEROUTPUT ON;
SET VERIFY OFF;

select * from MenuItems2;
	
DECLARE

	ITEM_ID_ int:= 8;
	ITEM_PRICE MenuItems2.price%TYPE := 233;
	ITEM_NAME MenuItems2.name%TYPE := 'SET MENU';
	ITEM_DES MenuItems2.description%TYPE:='Fried rice and chicken';
	ITEM_CATEGORY MenuItems2.category%TYPE := 'Chinese';	
	
	NEGATIVE EXCEPTION;  
BEGIN

	if ITEM_CAT = 'Bangalee' THEN
		delete MenuItems2 where item_id=ITEM_ID_;
		insert into MenuItems1@site_link(item_id,price,name,description,category) values(ITEM_ID_,ITEM_PRICE,ITEM_NAME,ITEM_DES,ITEM_CATEGORY);
		
	ELSIF ITEM_CAT = 'Chinese' THEN
		UPDATE MenuItems2 SET price = ITEM_PRICE, name = ITEM_NAME, description = ITEM_DES, category = ITEM_CATEGORY WHERE item_id = ITEM_ID_;
		
	ELSE
		RAISE NEGATIVE;
	end if;

EXCEPTION
  WHEN NEGATIVE THEN
    DBMS_OUTPUT.PUT_LINE('Negative, so not found.');		
   
END;
/
