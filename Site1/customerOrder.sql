SET SERVEROUTPUT ON;
SET VERIFY OFF;

/*MENU TABLE AGAIN*/

	drop table MENU;
	CREATE TABLE MENU AS 
	SELECT * FROM MenuItems1 
	UNION 
	SELECT * FROM MenuItems2@site_link;
	
	ALTER TABLE MENU
	ADD PRIMARY KEY (item_id);
	
	
--select * from MenuItems1 union select * from MenuItems2@site_link;
--select * from MenuItems1;
--select * from MenuItems2@site_link;
DECLARE
  CID Customers1.customer_id%TYPE := &input_customer_id;
  ORDER_ID_ Orders1.order_id%TYPE;
  current_date DATE;
  QUANTITY_ Orders1.quantity%TYPE;
  TOTAL Orders1.total_amount%TYPE;
  ITEM_ID_ MenuItems1.item_id%TYPE;
  ITEM_PRICE MenuItems1.price%TYPE;
BEGIN
	  current_date := SYSDATE;
	  DBMS_OUTPUT.PUT_LINE('ID'||'  '||'Item Name'||'  '||'Item Price');
	  FOR R IN (select * from MenuItems1 union select * from MenuItems2@site_link) LOOP
		DBMS_OUTPUT.PUT_LINE(R.item_id || '     ' || R.name || '     ' || R.price);
	  END LOOP;
	  DBMS_OUTPUT.PUT_LINE('Please select an item ::');
	  ITEM_ID_ := 8;
	  DBMS_OUTPUT.PUT_LINE(ITEM_ID_);
	  DBMS_OUTPUT.PUT_LINE('Select QUANTITY ::');
	  QUANTITY_ := 2;
	  DBMS_OUTPUT.PUT_LINE(QUANTITY_);
	  DBMS_OUTPUT.PUT_LINE('Customer ID :');
	  DBMS_OUTPUT.PUT_LINE(CID);
	  
	  select price into ITEM_PRICE from MENU where item_id=ITEM_ID_;
	  DBMS_OUTPUT.PUT_LINE('ITEM PRICE:');
	  DBMS_OUTPUT.PUT_LINE(ITEM_PRICE);
	  TOTAL := QUANTITY_ * ITEM_PRICE;
	  DBMS_OUTPUT.PUT_LINE('Total price');
	  DBMS_OUTPUT.PUT_LINE(TOTAL);
	  
	  select count(order_id) into ORDER_ID_ from (Select * from Orders1 union Select * from Orders2@site_link);
	  ORDER_ID_ := ORDER_ID_ + 1;
	  if TOTAL <500 then 
		insert into Orders1(order_id,customer_id,order_date,quantity,total_amount,item_id) values(ORDER_ID_,CID,current_date,QUANTITY_,TOTAL,ITEM_ID_);
	  ELSE
		insert into Orders2@site_link(order_id,customer_id,order_date,quantity,total_amount,item_id) values(ORDER_ID_,CID,current_date,QUANTITY_,TOTAL,ITEM_ID_);
	  end if;
END;
/


