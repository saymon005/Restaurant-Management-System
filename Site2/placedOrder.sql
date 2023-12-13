SET SERVEROUTPUT ON;
SET VERIFY OFF;

drop table ORDERS;
	CREATE TABLE ORDERS AS 
	SELECT * FROM Orders2
	UNION 
	SELECT * FROM Orders1@site_link;
	
	ALTER TABLE ORDERS
	ADD PRIMARY KEY (order_id);

declare 

	PID Placed_Order.placed_id%TYPE;
	ADDRS Placed_Order.address%TYPE := 'dhaka';
	EML Placed_Order.email%TYPE :='abc@gmail.com';
	CID Placed_Order.customer_id%TYPE:=&CUSTOMER_INPUT;
	TOTAL Placed_Order.total_amount%TYPE;
	SUM1 int :=0;
Begin 
	
	for R in (select total_amount from ORDERS)
	LOOP
		SUM1:=SUM1 + R.total_amount;
	END LOOP;
	
	select count(placed_id) into PID from Placed_Order;
	PID :=PID + 1;
	
	insert into Placed_Order(placed_id,address,email,customer_id,total_amount) values(PID,ADDRS,EML,CID,SUM1);
	delete Orders1@site_link where customer_id=CID;
	delete Orders2 where customer_id=CID;
end;
/