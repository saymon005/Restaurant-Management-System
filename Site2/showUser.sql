SET SERVEROUTPUT ON;
SET VERIFY OFF;

-- SHOW USER
DECLARE

BEGIN
      DBMS_OUTPUT.PUT_LINE('All users from site2');
	 for R in (SELECT * from Customers2 join Customers1@site_link on Customers2.customer_id=Customers1.customer_id@site_link)
	 LOOP
		DBMS_OUTPUT.PUT_LINE(R.name);
	 END LOOP;
END;
/