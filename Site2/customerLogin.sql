SET SERVEROUTPUT ON;
SET VERIFY OFF;

DECLARE
  cid Customers2.customer_id%TYPE := &input_customerID;
  flag NUMBER := 0;
  UnSUCCESS_LOGIN EXCEPTION;
BEGIN
  FOR R IN (SELECT Customers2.customer_id
            FROM Customers2 JOIN Customers1@site_link ON Customers2.customer_id = Customers1.customer_id@site_link)
  LOOP
    IF cid = R.customer_id THEN
      flag := 1;
    END IF;
  END LOOP;
  IF flag = 1 THEN
    DBMS_OUTPUT.PUT_LINE('Login SUCCESSFUL');
  ELSE
    RAISE UnSUCCESS_LOGIN;
  END IF;
EXCEPTION
  WHEN UnSUCCESS_LOGIN THEN
    DBMS_OUTPUT.PUT_LINE('Customer id is incorrect');
END;
/
