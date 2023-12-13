SET SERVEROUTPUT ON;
SET VERIFY OFF;

/*
CREATE TABLE Reservations (
  reservation_id INT PRIMARY KEY,
  customer_id INT,
  table_id INT,
  reservation_date DATE,
  guests INT
);
,
  FOREIGN KEY (customer_id) REFERENCES Customers1(customer_id),
  FOREIGN KEY (table_id) REFERENCES Tables1(table_id)
*/

select * from Tables1@site_link;

declare 
	
	TID int :=&TABLE_ID_INPUT;
	CID int :=& CUSTOMER_ID_INPUT;
	current_date date;
	GUEST_ INT;
	RID INT;
	ST INT;
	STS VARCHAR(20):='Unavailable';
BEGIN
	current_date := SYSDATE;
	select count(reservation_id) into RID from Reservations@site_link;
	RID := RID + 1;
	
	select seats into ST from Tables1@site_link where table_id = TID;
	GUEST_ := ST;
	
	INSERT into Reservations@site_link(reservation_id,customer_id,table_id,reservation_date,guests) values(RID,CID,TID,current_date,GUEST_);
	
	insert into Tables2(table_id,seats,status) values(TID,ST,STS);
	
	delete Tables1@site_link where table_id=TID;
end;
/