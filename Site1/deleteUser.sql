SET SERVEROUTPUT ON;
SET VERIFY OFF;

-- delete user
DECLARE

	cid Customers1.customer_id%TYPE := &DEL_USER;
BEGIN
    delete Customers2@site_link where Customers2.customer_id@site_link=cid;
	delete Customers1 where customer_id=cid;
END;
/