SET SERVEROUTPUT ON;
SET VERIFY OFF;

DECLARE

	cid Customers2.customer_id%TYPE := &UP_USER;
BEGIN
    update Customers2 set email='abc@gmail.com' where customer_id=cid;
    update Customers1@site_link set address='tha 24,khilgaon' where Customers1.customer_id@site_link=cid;
END;
/