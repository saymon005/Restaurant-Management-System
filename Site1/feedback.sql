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
	FID_ Feedback1.fid%TYPE;
	ITEM_ID_ Feedback1.item_id%TYPE := &ITEM_ID_INPUT;
	MSG Feedback2.message%TYPE := &MESSAGE_;
	PT Feedback2.points%TYPE;
	NOT_CORRECT EXCEPTION;
	flag int := 0;
BEGIN
	SELECT COUNT(fid) INTO FID_ FROM Feedback1;
	FID_ := FID_ + 1;
	
	IF (MSG = 'GOOD') THEN
		PT := 5;
		SELECT fid INTO FID_ FROM Feedback1 where item_id=ITEM_ID_;
		
		IF (flag = 1) THEN
			DBMS_OUTPUT.PUT_LINE('INSERTED');
			INSERT INTO Feedback1 (fid, item_id) VALUES (FID_, ITEM_ID_);
			INSERT INTO Feedback2@site_link (fid, message, points) VALUES (FID_, MSG, PT);
		ELSE
			DBMS_OUTPUT.PUT_LINE('UPDATED');
			SELECT points INTO PT FROM Feedback2 WHERE item_id=ITEM_ID_;
			PT := PT + 5;
			UPDATE Feedback2 SET points = PT WHERE item_id=ITEM_ID_;
		END IF;
		
	ELSIF (MSG = 'BAD') THEN
		PT := 0;
		SELECT item_id INTO ITEM_ID_ FROM Feedback1 WHERE item_id=ITEM_ID_;
		
		IF (flag = 1) THEN
			DBMS_OUTPUT.PUT_LINE('INSERTED');
			INSERT INTO Feedback1@site_link (fid, item_id) VALUES (FID_, ITEM_ID_);
			INSERT INTO Feedback2 (fid, message, points) VALUES (FID_, MSG, PT);
		ELSE
			DBMS_OUTPUT.PUT_LINE('UPDATED');
			SELECT points INTO PT FROM Feedback2 WHERE item_id=ITEM_ID_;
			PT := PT - 5;
			UPDATE Feedback2 SET points = PT WHERE item_id=ITEM_ID_;
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

