SET SERVEROUTPUT ON;
SET VERIFY OFF;

/*  MENU ITEM SHOW */ 
DECLARE

BEGIN
     DBMS_OUTPUT.PUT_LINE('Name of items we have');
	 for R in (SELECT * from MenuItems1 union select *from MenuItems2@site_link)
	 LOOP
		DBMS_OUTPUT.PUT_LINE(R.name);
	 END LOOP;
END;
/