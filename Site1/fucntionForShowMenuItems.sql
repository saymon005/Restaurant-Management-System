SET SERVEROUTPUT ON;
SET VERIFY OFF;

CREATE OR REPLACE FUNCTION showMenuItems(item_id in MenuItems1.item_id%type, name in MenuItems1.name%type, description in MenuItems1.description%type, price in MenuItems1.price%type, category in MenuItems1.category%type)
return MenuItems1.name%type
IS
DECLARE
   ITEMS_NAME MenuItems1.name%type;
BEGIN
  
     DBMS_OUTPUT.PUT_LINE('ALL ITEMS');
	 SELECT name into ITEMS_NAME from MenuItems11 join MenuItems2@site_link on Customers1.customer_id=Customers2.customer_id@site_link;

	 return ITEMS_NAME;

END showMenuItems;

/


