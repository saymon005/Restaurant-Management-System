SET SERVEROUTPUT ON;
SET VERIFY OFF;


CREATE OR REPLACE PACKAGE USERS AS
  PROCEDURE SHOW_USER(CID in Customers1.customer_id%TYPE);
  PROCEDURE INSERT_USER(cid in Customers1.customer_id%TYPE,NAME in Customers1.nameTYPE, ADDRESS in Customers1.address%TYPE,
    PHONE in Customers2.phone_number@site_link%TYPE, EMAIL in Customers2.email@site_link%TYPE, GENDER in Customers1.gender%TYPE);
END USERS;
/
 
CREATE OR REPLACE PACKAGE BODY USERS AS
  PROCEDURE SHOW_USER(CID in Customers1.customer_id%TYPE)
  IS 
  BEGIN
    FOR R in (SELECT * from Customers1 join Customers2@site_link on Customers1.customer_id=Customers2.customer_id@site_link where Customers1.customer_id=CID)
    LOOP	
      DBMS_OUTPUT.PUT_LINE(R.customer_id);
      DBMS_OUTPUT.PUT_LINE(R.name);
      DBMS_OUTPUT.PUT_LINE(R.address);
      DBMS_OUTPUT.PUT_LINE(R.phone_number);
      DBMS_OUTPUT.PUT_LINE(R.email);
      DBMS_OUTPUT.PUT_LINE(R.gender);
    END LOOP; 
  END SHOW_USER;

  PROCEDURE INSERT_USER(cid in Customers1.customer_id%TYPE,NAME in Customers1.nameTYPE, ADDRESS in Customers1.address%TYPE,
    PHONE in Customers2.phone_number@site_link%TYPE, EMAIL in Customers2.email@site_link%TYPE, GENDER in Customers1.gender%TYPE)
  IS
  BEGIN
    insert into Customers2@site_link values (cid, PHONE, EMAIL, GENDER);
    insert into Customers1 values (cid, NAME, ADDRESS, GENDER);
  END INSERT_USER;
END USERS;
/

CREATE OR REPLACE FUNCTION showMenuItems(iid in MenuItems1.item_id%type)
return VARCHAR
IS
DECLARE
   ITEMS_NAME MenuItems1.name%type;
BEGIN
  
     DBMS_OUTPUT.PUT_LINE('ALL ITEMS');
	 SELECT name into ITEMS_NAME from MenuItems1 union SELECT name into ITEMS_NAME from MenuItems2@site_link where item_id = iid;

	 return ITEMS_NAME;

END showMenuItems;

/

DECLARE

    /*
	cid Customers1.customer_id%TYPE := &CID;
	NAME Customers2@site_link.name%TYPE := &NAME; 
	ADDRESS Customers2@site_link.address%TYPE := &ADDRESS;
	PHONE Customers1.phone_number%TYPE := &PHONE; 
	EMAIL Customers1.email%TYPE := &EMAIL;
	GENDER Customers1.gender%TYPE := &GENDER;
	*/
	cid Customers1.customer_id%TYPE := 11; 
	NAME Customers1.name%TYPE := 'SAYMON';
	ADDRESS Customers1.address%TYPE := 'DHAKA';
	PHONE Customers2.phone_number@site_link%TYPE := '1234567890';
	EMAIL Customers2.email@site_link%TYPE := 'saymon@example.com';
	GENDER Customers2.gender@site_link%TYPE := 'Male';

BEGIN
	USERS.SHOW_USER(cid);
	USERS.INSERT_USER(cid,NAME,ADDRESS,PHONE,EMAIL.GENDER);
	DBMS_OUTPUT.PUT_LINE(USERS.showMenuItems(item_id));
END;
/
