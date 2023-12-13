SET SERVEROUTPUT ON;
SET VERIFY OFF;

	drop table MENU;
	CREATE TABLE MENU AS 
	SELECT * FROM MenuItems1 
	UNION 
	SELECT * FROM MenuItems2;
	
	ALTER TABLE MENU
	ADD PRIMARY KEY (item_id);

	SELECT * from MENU;
DECLARE 
	FID_ int;
	ITEM_ID_ int := 11;
	MSG  VARCHAR(50):= 'bad';
	PT int;
	NOT_CORRECT EXCEPTION;
	flag int := 0;
BEGIN

	IF (MSG = 'good') THEN
		PT := 5;
		SELECT Feedback1.fid@site_link INTO FID_ FROM Feedback1@site_link where Feedback1.item_id@site_link=11;
		
		IF (flag = 1) THEN
			DBMS_OUTPUT.PUT_LINE('INSERTED');
			INSERT INTO Feedback1@site_link (fid, item_id) VALUES (FID_, ITEM_ID_);
			INSERT INTO Feedback2 (fid, message, points) VALUES (FID_, MSG, PT);
		ELSE
			DBMS_OUTPUT.PUT_LINE('UPDATED');
		  select points into PT from Feedback2 join Feedback1@site_link on Feedback2.fid=Feedback1.fid@site_link WHERE item_id=11 and ROWNUM=1;
		  select Feedback2.fid into FID_ from Feedback2 join Feedback1@site_link on Feedback2.fid=Feedback1.fid@site_link WHERE item_id=11 and ROWNUM=1;
			PT := PT + 5;
			UPDATE Feedback2 SET points = PT WHERE Feedback2.fid=FID_;
		END IF;
		
	ELSIF (MSG = 'bad') THEN
		PT := 0;

		
		IF (flag = 1) THEN
			DBMS_OUTPUT.PUT_LINE('INSERTED');
			INSERT INTO Feedback1@site_link (fid, item_id) VALUES (FID_, ITEM_ID_);
			INSERT INTO Feedback2 (fid, message, points) VALUES (FID_, MSG, PT);
		ELSE
			DBMS_OUTPUT.PUT_LINE('UPDATED');
		  select points into PT from Feedback2 join Feedback1@site_link on Feedback2.fid=Feedback1.fid@site_link WHERE item_id=11 and ROWNUM=1;
		  select Feedback2.fid into FID_ from Feedback2 join Feedback1@site_link on Feedback2.fid=Feedback1.fid@site_link WHERE item_id=11 and ROWNUM=1;
			PT := PT - 5;
			UPDATE Feedback2 SET points = PT WHERE Feedback2.fid=FID_;
		END IF;
		
	ELSE
		RAISE NOT_CORRECT;
	END IF;

EXCEPTION
	WHEN NO_DATA_FOUND THEN
		flag := 1;
		DBMS_OUTPUT.PUT_LINE('DATA NOT FOUND');
	WHEN NOT_CORRECT THEN
		DBMS_OUTPUT.PUT_LINE('MESSAGE NOT CORRECT');
END;
/


		SELECT item_id INTO ITEM_ID_ FROM Feedback1@site_link WHERE item_id=ITEM_ID_;