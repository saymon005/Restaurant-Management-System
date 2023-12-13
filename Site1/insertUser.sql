SET SERVEROUTPUT ON;
SET VERIFY OFF;

-- INSERT USER
DECLARE

	cid Customers1.customer_id%TYPE := 11; 
	NAME Customers1.name%TYPE := 'Johnas Doe';
	ADDRESS Customers1.address%TYPE := '111 Main St';
	PHONE Customers2.phone_number@site_link%TYPE := '1234567890';
	EMAIL Customers2.email@site_link%TYPE := 'johndoe@example.com';
	GENDER Customers2.gender@site_link%TYPE := 'Male';
BEGIN
    insert into Customers2@site_link values (cid, PHONE, EMAIL, GENDER);
    insert into Customers1 values (cid, NAME, ADDRESS, GENDER);
END;
/