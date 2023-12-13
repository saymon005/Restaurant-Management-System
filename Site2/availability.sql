SET SERVEROUTPUT ON;
SET VERIFY OFF;

declare 
	TID int:=&INPUT_TID;
	ST Tables2.seats%TYPE;
	STS Tables2.status%TYPE:='Available';
begin
	SELECT seats into ST from Tables2 where table_id = TID;
	insert into Tables1@site_link(table_id,seats,status) values(TID,ST,STS);
	delete Tables2 where table_id=TID;
end;
/