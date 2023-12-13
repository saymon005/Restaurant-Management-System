SET SERVEROUTPUT ON;
SET VERIFY OFF;

DECLARE

	cid Customers2.customer_id%TYPE := &DEL_USER;
BEGIN
    delete Customers2 where customer_id=cid;
	delete Customers1@site_link where Customers1.customer_id@site_link=cid;
END;
/