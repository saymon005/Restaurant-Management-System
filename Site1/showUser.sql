SET SERVEROUTPUT ON;
SET VERIFY OFF;

-- SHOW USER
DECLARE

BEGIN
      DBMS_OUTPUT.PUT_LINE('ALL USERS FROM SITE1');
	 for R in (SELECT * from Customers1 join Customers2@site_link on Customers1.customer_id=Customers2.customer_id@site_link)
	 LOOP
		DBMS_OUTPUT.PUT_LINE(R.name);
	 END LOOP;
END;
/