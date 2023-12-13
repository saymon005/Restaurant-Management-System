SET SERVEROUTPUT ON;
SET VERIFY OFF;

-- update user
DECLARE

	cid Customers1.customer_id%TYPE := &UP_USER;
BEGIN
    --update Customers2@site_link set email='abc@gmail.com' where Customers2@site_link.customer_id.=cid;
    update Customers1 set address='tha 24,khilgaon' where customer_id=cid;
END;
/