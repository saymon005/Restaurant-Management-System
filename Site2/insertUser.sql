SET SERVEROUTPUT ON;
SET VERIFY OFF;

DECLARE

	cid Customers2.customer_id%TYPE := 11; 
	NAME Customers1.name@site_link%TYPE := 'Johnas Doe';
	ADDRESS Customers1.address@site_link%TYPE := '111 Main St';
	PHONE Customers2.phone_number%TYPE := '1234567890';
	EMAIL Customers2.email%TYPE := 'johndoe@example.com';
	GENDER Customers2.gender%TYPE := 'M';
BEGIN
    insert into Customers2 values (cid, PHONE, EMAIL, GENDER);
    insert into Customers1@site_link values (cid, NAME, ADDRESS, GENDER);
END;
/