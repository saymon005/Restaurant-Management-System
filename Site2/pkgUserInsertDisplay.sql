

SET SERVEROUTPUT ON;
SET VERIFY OFF;

CREATE OR REPLACE PACKAGE USERS AS
  Procedure SHOW_USER(CID in Customers2.customer_id%TYPE);
  PROCEDURE INSERT_USER(cid in Customers2.customer_id%TYPE,NAME in Customers1.name@site_link%TYPE, ADDRESS in Customers1.address@site_link%TYPE,
    PHONE in Customers2.phone_number%TYPE, EMAIL in Customers2.email%TYPE, GENDER in Customers2.gender%TYPE);
END USERS;
/
 
CREATE OR REPLACE PACKAGE BODY USERS AS
  Procedure SHOW_USER(CID in Customers2.customer_id%TYPE)
  IS 
  BEGIN
    for R in (SELECT * from Customers2 join Customers1@site_link on Customers2.customer_id=Customers1.customer_id@site_link where Customers2.customer_id=CID)
    LOOP	
      DBMS_OUTPUT.PUT_LINE(R.customer_id);
      DBMS_OUTPUT.PUT_LINE(R.name);
      DBMS_OUTPUT.PUT_LINE(R.address);
      DBMS_OUTPUT.PUT_LINE(R.phone_number);
      DBMS_OUTPUT.PUT_LINE(R.email);
      DBMS_OUTPUT.PUT_LINE(R.gender);
    END LOOP; 
  END SHOW_USER;

  PROCEDURE INSERT_USER(cid in Customers2.customer_id%TYPE,NAME in Customers1.name@site_link%TYPE, ADDRESS in Customers1.address@site_link%TYPE,
    PHONE in Customers2.phone_number%TYPE, EMAIL in Customers2.email%TYPE, GENDER in Customers2.gender%TYPE)
  IS
  BEGIN
    insert into Customers2 values (cid, PHONE, EMAIL, GENDER);
    insert into Customers1@site_link values (cid, NAME, ADDRESS, GENDER);
  END INSERT_USER;
END USERS;
/



DECLARE

	cid Customers2.customer_id%TYPE := &CID;
	NAME Customers1@site_link.name%TYPE := &NM; 
	ADDRESS Customers1@site_link.address%TYPE := &AD;
	PHONE Customers2.phone_number%TYPE := &PHN; 
	EMAIL Customers2.email%TYPE := &EML;
	GENDER Customers2.gender%TYPE := &GNDR;

BEGIN
	mypack.SHOW_USER(cid);
END;
/






CREATE OR REPLACE PACKAGE BODY USERS AS
  Procedure SHOW_USER(ID in Customers2.customer_id%TYPE)
  IS 
  BEGIN
    for R in (SELECT * from Customers2 join Customers1@site_link on Customers2.customer_id=Customers1@site_link.customer_id);
    LOOP	
      DBMS_OUTPUT.PUT_LINE(R.customer_id);
      DBMS_OUTPUT.PUT_LINE(R.name);
      DBMS_OUTPUT.PUT_LINE(R.address);
      DBMS_OUTPUT.PUT_LINE(R.phone_number);
      DBMS_OUTPUT.PUT_LINE(R.email);
      DBMS_OUTPUT.PUT_LINE(R.gender);
    END LOOP;
  END SHOW_USER;
END USERS;
/

DECLARE
	cid Customers2.customer_id%TYPE := 1; -- Replace with actual values
	NAME Customers1@site_link.name%TYPE := 'John Doe';
	ADDRESS Customers1@site_link.address%TYPE := '1 Main St';
	PHONE Customers2.phone_number%TYPE := '1234567890';
	EMAIL Customers2.email%TYPE := 'johndoe@example.com';
	GENDER Customers2.gender%TYPE := 'M';
BEGIN
	USERS.SHOW_USER(cid);
END;
/

