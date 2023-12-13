SET SERVEROUTPUT ON;
SET VERIFY OFF;

DECLARE

BEGIN
	DBMS_OUTPUT.PUT_LINE('Here is how many category we have.');
	 for R in (SELECT * from MenuItems2 union SELECT * from MenuItems1@site_link)
	 LOOP
		DBMS_OUTPUT.PUT_LINE(R.category);
	 END LOOP;
END;
/